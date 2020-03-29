part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();
}

class NotificationInitial extends NotificationState {
  @override
  List<Object> get props => [];
}

class NotificationChangePageState extends NotificationState {
  
  final int pageIndex;

  NotificationChangePageState({
   @required this.pageIndex
  });
  @override
  List<Object> get props => [pageIndex];

}
