import 'package:freo_wiki/core/models/wiki_response_network_model.dart';
import 'package:freo_wiki/feature/home/ui/widgets/wiki_page_item_widget.dart';

class WikiPageUiMapper {
  List<WikiPageItemPresentationModel> mapWikiResponseToPresentationModel(
      WikiResponseQueryNetworkModel networkModel) {
    return networkModel.pages!
        .map((item) => _mapWikiPageItemPresentationModel(item!))
        .toList();
  }

  WikiPageItemPresentationModel _mapWikiPageItemPresentationModel(
      WikiPageItemNetworkModel model) {
    return WikiPageItemPresentationModel(
      pageId: model.pageId,
      ns: model.ns,
      title: model.title,
      index: model.index,
      thumbnail: model.thumbnail != null ? model.thumbnail!.source : null,
      description: model.terms != null ? model.terms!.description : null,
    );
  }
}
