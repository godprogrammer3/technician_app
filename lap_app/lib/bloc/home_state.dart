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
  List<Object> get props => [message, color];
}

class HomeLoadingState extends HomeState {
  @override
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
  List<Object> get props => [searchString,jobs];
}

class ChangeToYourTaskView extends HomeState {
  @override
  List<Object> get props => null;
}

class ChangeToWaitTaskView extends HomeState {
  @override
  List<Object> get props => null;
}

class HomeChangePageState extends HomeState {
  final int pageIndex;

  HomeChangePageState({
    @required this.pageIndex,
  });
  @override
  List<Object> get props => [pageIndex];
}
