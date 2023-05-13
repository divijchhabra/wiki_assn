import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freo_wiki/core/helpers/wiki_debouncer.dart';
import 'package:freo_wiki/feature/home/bloc/dashboard_bloc.dart';

class CustomSearchTextFieldWidget extends StatelessWidget {
  CustomSearchTextFieldWidget({Key? key, required this.controller})
      : super(key: key);

  final TextEditingController controller;
  final _deBouncer = WikiDeBouncer();

  void _addWikiSearchQueryEvent(context) {
    BlocProvider.of<DashBoardBloc>(context)
        .add(WikiSearchEvent(searchText: controller.text));
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: (searchText) {
        _deBouncer.call(searchText.isEmpty ? 0 : 600,
                () => _addWikiSearchQueryEvent(context));
      },
      decoration: InputDecoration(
          fillColor: Colors.grey.shade300,
          filled: true,
          hintText: 'Search Wiki',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          suffix: GestureDetector(
            onTap: () {
              controller.clear();
              _addWikiSearchQueryEvent(context);
              FocusScope.of(context).unfocus();
            },
            child: const CircleAvatar(
                radius: 10,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.close,
                  size: 12,
                  color: Colors.white,
                )),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            ),
          ),
          contentPadding: const EdgeInsets.only(top: 8, left: 16, right: 8)),
    );
  }
}
