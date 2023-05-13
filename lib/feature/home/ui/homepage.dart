import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freo_wiki/di/app_dependency_injector.dart';
import 'package:freo_wiki/feature/home/ui/widgets/textfield_search_widget.dart';
import 'package:freo_wiki/feature/home/ui/widgets/wiki_results_widget.dart';
import 'package:freo_wiki/feature/home/bloc/dashboard_bloc.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final DashBoardBloc _dashBoardBloc =
      AppDependencyInjector.getIt.get<DashBoardBloc>();
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _dashBoardBloc,
        child: Scaffold(
          appBar: AppBar(
            title: SizedBox(
              height: 42,
              child: CustomSearchTextFieldWidget(controller: _controller),
            ),
          ),
          body: BlocBuilder<DashBoardBloc, DashboardState>(
            builder: (context, state) {
              if (state is WikiResultsSuccessState) {
                final wikiResults = _controller.text.isEmpty
                    ? state.cachedWikiUserData.reversed.toList()
                    : state.wikiSearchResultsData;
                return WikiResultsWidget(
                  wikiResults: wikiResults,
                  isCachedData: _controller.text.isEmpty,
                );
              } else if (state is WikiResultsFailedState) {
                return const Center(
                    child: Text(
                  'No Results Found',
                  style: TextStyle(fontSize: 20),
                ));
              } else if (state is DashBoardInitialState) {
                return const Center(
                    child: Text(
                  'No Recent Searches',
                  style: TextStyle(fontSize: 20),
                ));
              }
              return const SizedBox();
            },
          ),
        ));
  }
}
