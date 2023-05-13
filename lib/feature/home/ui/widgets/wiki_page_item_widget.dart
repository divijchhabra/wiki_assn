import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';
import 'package:freo_wiki/feature/home/bloc/dashboard_bloc.dart';

class WikiPageItemWidget extends StatelessWidget {
  const WikiPageItemWidget(
      {Key? key, required this.pageItem, required this.isCachedPageItem})
      : super(key: key);

  final WikiPageItemPresentationModel pageItem;
  final bool isCachedPageItem;

  _launchUrl(int id) async {
    final url = Uri.parse('https://en.wikipedia.org/?curid=$id');
    if (!await launchUrl(url,
        mode: Platform.isIOS
            ? LaunchMode.inAppWebView
            : LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<DashBoardBloc>(context)
            .add(WikiPageItemClickEvent(pageItem: pageItem));
        _launchUrl(pageItem.pageId);
      },
      child: ListTile(
        title: Text(
          pageItem.title,
        ),
        leading: isCachedPageItem
            ? Transform.rotate(
                angle: 5.3, child: const Icon(Icons.arrow_right_alt_outlined))
            : const SizedBox(),
        subtitle: Text(
          pageItem.description?[0] ?? "",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: pageItem.thumbnail == null
            ? const SizedBox()
            : ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.network(
                  pageItem.thumbnail!,
                  fit: BoxFit.cover,
                  height: 50,
                  width: 50,
                ),
              ),
      ),
    );
  }
}

class WikiPageItemPresentationModel {
  final int pageId;
  final int ns;
  final String title;
  final int index;
  final String? thumbnail;
  final List? description;

  const WikiPageItemPresentationModel(
      {required this.pageId,
      required this.ns,
      required this.title,
      required this.index,
      required this.thumbnail,
      required this.description});
}
