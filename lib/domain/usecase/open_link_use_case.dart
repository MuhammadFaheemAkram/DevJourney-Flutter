import 'package:dev_journey/core/common/app_exception.dart';
import 'package:dev_journey/core/common/result.dart';
import 'package:dev_journey/domain/service/link_opener.dart';
import 'package:injectable/injectable.dart';

/// Opens a link in the in-app browser, `https` only.
///
/// Links come from the catalog and from the user's own notes, so anything
/// else (`http:`, `javascript:`, `file:`, an app scheme) is refused here,
/// before the platform sees it.
@injectable
class OpenLinkUseCase {
  const OpenLinkUseCase(this._opener);

  final LinkOpener _opener;

  Future<Result<void>> call(Uri url) async {
    if (url.scheme != 'https' || url.host.isEmpty) {
      return const Err(UnsafeLinkException());
    }
    return await _opener.open(url)
        ? const Ok(null)
        : const Err(LinkOpenFailedException());
  }
}
