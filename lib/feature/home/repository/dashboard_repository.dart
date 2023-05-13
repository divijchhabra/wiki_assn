import 'package:freo_wiki/core/api_service/wiki_service.dart';
import 'package:freo_wiki/core/models/wiki_response_network_model.dart';

class DashBoardRepository {
  final WikiService _databaseService;

  const DashBoardRepository(this._databaseService);

  Future<WikiResponseNetworkModel> wikiSearchQuery(String searchText) {
    try {
      return _databaseService.getWikiResults(searchText);
    } on Exception catch (e) {
      throw Exception(e);
    }
  }
}
