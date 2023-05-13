part of 'dashboard_bloc.dart';

abstract class DashboardState extends Equatable {
  const DashboardState();

  @override
  List<Object?> get props => [];
}

class DashBoardInitialState extends DashboardState {
  const DashBoardInitialState();
}

class WikiResultsSuccessState extends DashboardState {
  final List<WikiPageItemPresentationModel> wikiSearchResultsData;
  final List<WikiPageItemPresentationModel> cachedWikiUserData;

  const WikiResultsSuccessState(
      {required this.wikiSearchResultsData, required this.cachedWikiUserData});

  @override
  List<Object?> get props => [wikiSearchResultsData, cachedWikiUserData];

  WikiResultsSuccessState copyWith(
      {List<WikiPageItemPresentationModel>? wikiSearchResultsData,
      List<WikiPageItemPresentationModel>? cachedWikiUserData}) {
    return WikiResultsSuccessState(
        wikiSearchResultsData:
            wikiSearchResultsData ?? this.wikiSearchResultsData,
        cachedWikiUserData: cachedWikiUserData ?? this.cachedWikiUserData);
  }
}

class WikiResultsFailedState extends DashboardState {
  const WikiResultsFailedState();
}
