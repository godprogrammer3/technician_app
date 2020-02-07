import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Token extends Equatable{

  final String token;

  Token(
    @required this.token
  );

  @override
  // TODO: implement props
  List<Object> get props => [token];

}