part of 'your_task_bloc.dart';

abstract class YourTaskEvent extends Equatable {
  const YourTaskEvent();
}


class YourTaskChangePageEvent extends YourTaskEvent{
  final int pageIndex;

  YourTaskChangePageEvent({
    @required this.pageIndex
  });
  @override
  // TODO: implement props
  List<Object> get props => null;
  
}