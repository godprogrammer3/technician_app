import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
class Command extends Equatable {

  final String sendCommand;
  final String receiveCompleted;

  Command({
    @required this.sendCommand, 
    @required this.receiveCompleted
    });
  @override

  List<Object> get props => [
    sendCommand,
    receiveCompleted,
  ];

}