part of 'your_task_bloc.dart';

abstract class YourTaskState extends Equatable {
  const YourTaskState();
}

class YourTaskInitial extends YourTaskState {
  @override
  List<Object> get props => [];
}

class YourTaskChangePageState extends YourTaskState{
  final int pageIndex;

  YourTaskChangePageState(
    {
      @required this.pageIndex
    });
  @override
  // TODO: implement props
  List<Object> get props => null;

}
