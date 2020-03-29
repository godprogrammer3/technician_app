part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();
}

class NotificationChangePageEvent extends NotificationEvent{
  final int pageIndex;

  NotificationChangePageEvent({
    @required this.pageIndex,
    });
  @override
  List<Object> get props => [pageIndex];

}