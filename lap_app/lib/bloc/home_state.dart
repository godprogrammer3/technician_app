part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeErrorState extends HomeState {
  final String message;
  final Color color;

  HomeErrorState({
    @required this.message, 
    @required this.color,
    });
  @override
  // TODO: implement props
  List<Object> get props => null;

}


class HomeLoadingState extends HomeState {
  @override
  // TODO: implement props
  List<Object> get props => null;

}


class HomeGotoSearchPage extends HomeState {
  final String searchString;
  final List<dynamic> jobs;
  HomeGotoSearchPage({
    @required this.searchString,
    @required this.jobs, 
    });
  @override
  // TODO: implement props
  List<Object> get props => null;

}