import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freo_wiki/feature/home/repository/dashboard_repository.dart';
import 'package:freo_wiki/feature/home/repository/mapper/wiki_page_ui_mapper.dart';
import 'package:freo_wiki/feature/home/ui/widgets/wiki_page_item_widget.dart';

part 'dashboard_event.dart';

part 'dashboard_state.dart';

class DashBoardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashBoardRepository _dashBoardRepository;
  final WikiPageUiMapper _wikiPageUiMapper;

  DashBoardBloc(this._dashBoardRepository, this._wikiPageUiMapper)
      : super(const DashBoardInitialState()) {
    on<WikiSearchEvent>(_mapWikiSearchResults);
    on<WikiPageItemClickEvent>(_wikiPageItemClick);
  }

  final List<WikiPageItemPresentationModel> _cachedWikiUserData = [];

  void _wikiPageItemClick(
      WikiPageItemClickEvent event, Emitter<DashboardState> emit) {
    if (!_cachedWikiUserData.contains(event.pageItem)) {
      _cachedWikiUserData.add(event.pageItem);
    }

    emit((state as WikiResultsSuccessState)
        .copyWith(cachedWikiUserData: _cachedWikiUserData));
  }

  void _mapWikiSearchResults(
      WikiSearchEvent event, Emitter<DashboardState> emit) async {
    if (event.searchText.isEmpty) {
      if (_cachedWikiUserData.isEmpty) {
        emit(const DashBoardInitialState());
      } else {
        emit(WikiResultsSuccessState(
            wikiSearchResultsData: const [],
            cachedWikiUserData: _cachedWikiUserData));
      }
    } else {
      final response =
          await _dashBoardRepository.wikiSearchQuery(event.searchText);

      if (response.query != null) {
        final wikiSearchResultsData = _wikiPageUiMapper
            .mapWikiResponseToPresentationModel(response.query!);
        emit(WikiResultsSuccessState(
            wikiSearchResultsData: wikiSearchResultsData,
            cachedWikiUserData: _cachedWikiUserData));
      } else {
        emit(const WikiResultsFailedState());
      }
    }
  }
}
