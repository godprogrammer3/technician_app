part of 'wait_task_bloc.dart';

abstract class WaitTaskState extends Equatable {
  const WaitTaskState();
}

class WaitTaskInitial extends WaitTaskState {
  @override
  List<Object> get props => [];
}

class WaitTaskChangePageState extends WaitTaskState {
  final int pageIndex;
  WaitTaskChangePageState({
    @required this.pageIndex});
  @override
  // TODO: implement props
  List<Object> get props => null;
}
