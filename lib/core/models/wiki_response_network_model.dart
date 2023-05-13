class WikiResponseNetworkModel {
  final WikiResponseQueryNetworkModel? query;

  const WikiResponseNetworkModel({required this.query});

  factory WikiResponseNetworkModel.fromJson(Map<String, dynamic> json) {
    return WikiResponseNetworkModel(
        query: json['query'] != null
            ? WikiResponseQueryNetworkModel.fromJson(json['query'])
            : null);
  }
}

class WikiResponseQueryNetworkModel {
  final List<WikiPageItemNetworkModel?>? pages;

  const WikiResponseQueryNetworkModel({required this.pages});

  factory WikiResponseQueryNetworkModel.fromJson(Map<String, dynamic> json) {
    return WikiResponseQueryNetworkModel(
        pages: json['pages']
            ?.map<WikiPageItemNetworkModel>((e) =>
                WikiPageItemNetworkModel.fromJson(e as Map<String, dynamic>))
            .toList());
  }
}

class WikiPageItemNetworkModel {
  final int pageId;
  final int ns;
  final String title;
  final int index;
  final WikiPageItemThumbnailNetworkModel? thumbnail;
  final WikiPageItemTermsNetworkModel? terms;

  const WikiPageItemNetworkModel(
      {required this.pageId,
      required this.ns,
      required this.title,
      required this.index,
      required this.thumbnail,
      required this.terms});

  factory WikiPageItemNetworkModel.fromJson(Map<String, dynamic> json) {
    return WikiPageItemNetworkModel(
      pageId: json['pageid'],
      ns: json['ns'],
      title: json['title'],
      index: json['index'],
      thumbnail: json['thumbnail'] != null
          ? WikiPageItemThumbnailNetworkModel.fromJson(json['thumbnail'])
          : null,
      terms: json['terms'] != null
          ? WikiPageItemTermsNetworkModel.fromJson(json['terms'])
          : null,
    );
  }
}

class WikiPageItemThumbnailNetworkModel {
  final String source;
  final int width;
  final int height;

  const WikiPageItemThumbnailNetworkModel(
      {required this.source, required this.width, required this.height});

  factory WikiPageItemThumbnailNetworkModel.fromJson(
      Map<String, dynamic> json) {
    return WikiPageItemThumbnailNetworkModel(
      source: json['source'],
      width: json['width'],
      height: json['height'],
    );
  }
}

class WikiPageItemTermsNetworkModel {
  final List description;

  const WikiPageItemTermsNetworkModel({required this.description});

  factory WikiPageItemTermsNetworkModel.fromJson(Map<String, dynamic> json) {
    return WikiPageItemTermsNetworkModel(description: json['description']);
  }
}
