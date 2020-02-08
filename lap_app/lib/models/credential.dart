import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
class Credential extends Equatable{
  final String username;
  final String uuid;

  Credential(
    @required this.username, 
    @required this.uuid);
  @override
  List<Object> get props => [
    username, 
    uuid,
    ];

}
