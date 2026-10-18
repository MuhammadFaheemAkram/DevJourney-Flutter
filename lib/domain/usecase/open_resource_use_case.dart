import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/repository/resources_repository.dart';
import 'package:dev_journey/domain/usecase/open_link_use_case.dart';
import 'package:injectable/injectable.dart';

/// Opens a resource by id (from a search result, which carries only the id).
@injectable
class OpenResourceUseCase {
  const OpenResourceUseCase(this._resources, this._openLink);

  final ResourcesRepository _resources;
  final OpenLinkUseCase _openLink;

  Future<Result<void>> call(String id) async {
    final resource = await _resources.findResource(id);
    if (resource == null) return const Err(NotFoundException('resource'));
    return _openLink(resource.url);
  }
}
