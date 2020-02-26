part of 'auto_console_bloc.dart';

abstract class AutoConsoleEvent extends Equatable {
  const AutoConsoleEvent();
}

class AutoConsoleStartEvent extends AutoConsoleEvent {
  final Function callBackFunction;

  AutoConsoleStartEvent({
    @required this.callBackFunction
  });
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class AutoConsoleCompleteEvent extends AutoConsoleEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class AutoConsoleInitialEvent extends AutoConsoleEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;

}