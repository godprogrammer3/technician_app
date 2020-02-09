import 'package:equatable/equatable.dart';
abstract class Failure extends Equatable{
  @override
  // TODO: implement props
  List<Object> get props => null;

}
class ServerFailure extends Failure{}

class AuthenError extends Error{}