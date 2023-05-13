import 'package:flutter/material.dart';
import 'package:freo_wiki/feature/home/ui/widgets/wiki_page_item_widget.dart';
import 'package:collection/collection.dart';

class WikiResultsWidget extends StatelessWidget {
  const WikiResultsWidget(
      {super.key, required this.wikiResults, required this.isCachedData});

  final List<WikiPageItemPresentationModel> wikiResults;
  final bool isCachedData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: SizedBox(
            height: MediaQuery.of(context).size.height -
                Scaffold.of(context).appBarMaxHeight!,
            child: SingleChildScrollView(
              child: Column(
                children: wikiResults
                    .mapIndexed((index, e) => WikiPageItemWidget(
                          pageItem: wikiResults[index],
                          isCachedPageItem: isCachedData,
                        ))
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
