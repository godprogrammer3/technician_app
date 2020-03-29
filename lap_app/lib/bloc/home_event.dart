part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}


class HomeSearchEvent extends HomeEvent {
  final String searchString;
  HomeSearchEvent({
    @required this.searchString,
    });
  @override
  List<Object> get props => [
    searchString
  ];

}


class HomeErrorEvent extends HomeEvent {
  final String message;
  final Color color;
  HomeErrorEvent({
    @required this.message, 
    @required this.color, 
  });
  @override
  List<Object> get props => [
    message,
    color
  ];
  
}

//////////////////////////////////////
///change page Event
///
class ChangeToYourTaskViewEvent extends HomeEvent {
  @override
  List<Object> get props => null;
}
class ChangeToWaitTaskViewEvent extends HomeEvent {
  @override
  List<Object> get props => null;
}

class HomeChangePageEvent extends HomeEvent {
  final int pageIndex;

  HomeChangePageEvent({
    @required this.pageIndex,
    });
  @override
  List<Object> get props => [
    pageIndex
  ];

}