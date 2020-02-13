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
  // TODO: implement props
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
  // TODO: implement props
  List<Object> get props => null;

}

class  SearchResultLoadingState extends SearchResultState{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class SearchResultRebuildState extends SearchResultState{
  final List<dynamic> jobs;

  SearchResultRebuildState({
    @required this.jobs,
    });
  @override
  // TODO: implement props
  List<Object> get props => null;

}