import 'dart:async';

import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/learning_enums.dart';
import 'package:dev_journey/domain/model/resource_item.dart';
import 'package:dev_journey/domain/usecase/bookmark_resource_use_case.dart';
import 'package:dev_journey/domain/usecase/open_link_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_resources_use_case.dart';
import 'package:dev_journey/features/resources/cubit/resources_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// Resources, kept live (a bookmark anywhere shows here), narrowed in memory
/// by a search, a type and Saved. About thirty-five rows: filtering them in
/// Dart is instant, so there's no query or debounce per keystroke.
@injectable
class ResourcesCubit extends Cubit<ResourcesState> {
  ResourcesCubit(this._watchResources, this._bookmark, this._openLink)
    : super(const ResourcesState());

  final WatchResourcesUseCase _watchResources;
  final BookmarkResourceUseCase _bookmark;
  final OpenLinkUseCase _openLink;

  StreamSubscription<List<ResourceItem>>? _resources;

  void load() {
    _resources ??= _watchResources().listen(
      (resources) => emit(
        state.copyWith(status: ResourcesStatus.ready, resources: resources),
      ),
      onError: (Object _) =>
          emit(state.copyWith(status: ResourcesStatus.failure)),
    );
  }

  void search(String query) => emit(state.copyWith(query: query.trim()));

  void filterByType(ResourceType? type) => emit(state.copyWith(type: type));

  void showSavedOnly({required bool savedOnly}) =>
      emit(state.copyWith(savedOnly: savedOnly));

  Future<void> toggleBookmark(ResourceItem item) async =>
      _report(await _bookmark(item.resource.id, bookmarked: !item.bookmarked));

  Future<void> open(ResourceItem item) async =>
      _report(await _openLink(item.resource.url));

  void _report(Result<void> result) {
    if (isClosed) return;
    if (result case Err(:final exception)) {
      emit(
        state.copyWith(
          message: exception.message,
          messageSerial: state.messageSerial + 1,
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    await _resources?.cancel();
    return super.close();
  }
}
