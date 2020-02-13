part of 'search_result_bloc.dart';

abstract class SearchResultEvent extends Equatable {
  const SearchResultEvent();
}

class SearchResultBackPageEvent extends SearchResultEvent{
  @override
  // TODO: implement props
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
  // TODO: implement props
  List<Object> get props => null;

}

class SearchResultSearchEvent extends SearchResultEvent{
  final String searchString;

  SearchResultSearchEvent({
    @required this.searchString,
  });
  @override
  // TODO: implement props
  List<Object> get props => null;

}