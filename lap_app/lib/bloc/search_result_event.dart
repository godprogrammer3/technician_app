part of 'search_result_bloc.dart';

abstract class SearchResultEvent extends Equatable {
  const SearchResultEvent();
}

class SearchResultBackPageEvent extends SearchResultEvent{
  @override
  List<Object> get props => null;

}

class SearchResultErrorEvent extends SearchResultEvent{
  final String message;
  final Color color;

  SearchResultErrorEvent({
    @required this.message, 
    @required this.color,
    });
  @override
  List<Object> get props => null;

}

class SearchResultSearchEvent extends SearchResultEvent{
  final String searchString;

  SearchResultSearchEvent({
    @required this.searchString,
  });
  @override
  List<Object> get props => [searchString];

}

class GotoDetailJobEvent extends SearchResultEvent{
  @override
  List<Object> get props => null;

}