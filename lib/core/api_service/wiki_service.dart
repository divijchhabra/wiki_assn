import 'package:http/http.dart' as http;

import 'dart:convert';
import 'package:freo_wiki/core/models/wiki_response_network_model.dart';

class WikiService {
  static const baseUrl = 'https://en.wikipedia.org';

  Future<WikiResponseNetworkModel> getWikiResults(String searchText) async {
    final pathInfo =
        '/w/api.php?action=query&format=json&prop=pageimages%7Cpageterms&generator=prefixsearch&redirects=1&formatversion=2&piprop=thumbnail&pithumbsize=50&pilimit=10&wbptterms=description&gpssearch=$searchText&gpslimit=15';
    try {
      final response = await http.get(Uri.parse('$baseUrl/$pathInfo'));
      if (response.statusCode == 200) {
        return WikiResponseNetworkModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('error');
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
