part of 'wait_task_bloc.dart';

abstract class WaitTaskEvent extends Equatable {
  const WaitTaskEvent();
}


class WaitTaskChangePageEvent extends WaitTaskEvent{ 
  final int pageIndex;

  WaitTaskChangePageEvent({
    @required this.pageIndex,
  });
  @override
  // TODO: implement props
  List<Object> get props => null;

}