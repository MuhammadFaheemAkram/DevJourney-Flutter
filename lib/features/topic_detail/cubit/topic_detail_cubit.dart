import 'dart:async';

import 'package:clock/clock.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/model/learning_path.dart';
import 'package:dev_journey/domain/model/note.dart';
import 'package:dev_journey/domain/usecase/bookmark_topic_use_case.dart';
import 'package:dev_journey/domain/usecase/set_topic_completed_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_notes_use_case.dart';
import 'package:dev_journey/domain/usecase/watch_topic_use_case.dart';
import 'package:dev_journey/features/topic_detail/cubit/topic_detail_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

/// One topic and its notes, kept live: completing or bookmarking it shows
/// at once here, on its roadmap and on the Dashboard, because they all
/// watch the same rows.
@injectable
class TopicDetailCubit extends Cubit<TopicDetailState> {
  TopicDetailCubit(
    this._watchTopic,
    this._setCompleted,
    this._bookmark,
    this._watchNotes,
    this._clock,
    @factoryParam this.topicId,
  ) : super(TopicDetailState(now: _clock.now()));

  final WatchTopicUseCase _watchTopic;
  final SetTopicCompletedUseCase _setCompleted;
  final BookmarkTopicUseCase _bookmark;
  final WatchNotesUseCase _watchNotes;
  final Clock _clock;
  final String topicId;

  StreamSubscription<TopicDetails?>? _topic;
  StreamSubscription<List<NoteItem>>? _notes;

  void load() {
    _topic ??= _watchTopic(topicId).listen(
      (details) => emit(
        state.copyWith(
          details: details,
          status: details == null
              ? TopicDetailStatus.notFound
              : TopicDetailStatus.found,
          now: _clock.now(),
        ),
      ),
    );
    _notes ??= _watchNotes(
      topicId: topicId,
    ).listen((notes) => emit(state.copyWith(notes: notes, now: _clock.now())));
  }

  /// Completes the topic, or uncompletes it if it was (the same button).
  Future<void> toggleCompleted() async {
    final item = state.details?.item;
    if (item == null) return;
    _report(await _setCompleted(topicId, completed: !item.isCompleted));
  }

  Future<void> toggleBookmark() async {
    final item = state.details?.item;
    if (item == null) return;
    _report(await _bookmark(topicId, bookmarked: !item.bookmarked));
  }

  void _report(Result<void> result) {
    if (isClosed) return;
    if (result case Err(:final exception)) {
      emit(
        state.copyWith(
          errorMessage: exception.message,
          errorSerial: state.errorSerial + 1,
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    await _topic?.cancel();
    await _notes?.cancel();
    return super.close();
  }
}
