import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
class UserCredential extends Equatable{
  final String username;
  final String uuid;
  UserCredential({
    @required this.username, 
    @required this.uuid,
  });
  @override
  List<Object> get props => [
    username, 
    uuid,
    ];

  Map<String , dynamic > toJson(){
    return  {
      'username': this.username,
      'uuid': this.uuid,
    };
  }

}
