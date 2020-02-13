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
  // TODO: implement props
  List<Object> get props => null;

}


class HomeErrorEvent extends HomeEvent {
  final String message;
  final Color color;
  HomeErrorEvent({
    @required this.message, 
    @required this.color, 
  });
  @override
  // TODO: implement props
  List<Object> get props => null;
  
}