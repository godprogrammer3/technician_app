part of 'search_result_bloc.dart';

abstract class SearchResultState extends Equatable {
  const SearchResultState();
}

class SearchResultInitial extends SearchResultState {
  @override
  List<Object> get props => [];
}

class SearchResultBackPageState extends SearchResultState {
  @override
  List<Object> get props => null;

}

class SearchResultErrorState extends SearchResultState {
  final String message;
  final Color color;

  SearchResultErrorState({
    @required this.message, 
    @required this.color,
    });
  @override
  List<Object> get props => [message, color];

}

class  SearchResultLoadingState extends SearchResultState{
  @override
  List<Object> get props => null;

}

class SearchResultRebuildState extends SearchResultState{
  final List<dynamic> jobs;

  SearchResultRebuildState({
    @required this.jobs,
    });
  @override
  List<Object> get props => [jobs];

}


class GotoDetailJobState extends SearchResultState{
  @override
  List<Object> get props => null;

}