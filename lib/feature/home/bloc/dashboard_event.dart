part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class WikiSearchEvent extends DashboardEvent {
  final String searchText;

  const WikiSearchEvent({required this.searchText});
}

class WikiPageItemClickEvent extends DashboardEvent {
  final WikiPageItemPresentationModel pageItem;

  const WikiPageItemClickEvent({required this.pageItem});
}
