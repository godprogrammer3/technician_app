part of 'search_result_bloc.dart';

abstract class SearchResultState extends Equatable {
  const SearchResultState();
}

class SearchResultInitial extends SearchResultState {
  @override
  List<Object> get props => [];
}
