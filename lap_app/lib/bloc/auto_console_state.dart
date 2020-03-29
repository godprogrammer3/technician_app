part of 'auto_console_bloc.dart';

abstract class AutoConsoleState extends Equatable {
  const AutoConsoleState();
}

class AutoConsoleInitial extends AutoConsoleState {
  @override
  List<Object> get props => [];
}

class AutoConsoleErrorState extends AutoConsoleState {
  final String message;

  AutoConsoleErrorState({this.message});
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class AutoConsoleStartState extends AutoConsoleState{
  final ConsoleModel consoleModel;

  AutoConsoleStartState({
    @required this.consoleModel
  });
  @override
  // TODO: implement props
  List<Object> get props => null;

}