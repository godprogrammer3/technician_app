import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class TokenCredential extends Equatable{

  final String token;
  final String username;
  TokenCredential({
    @required this.token,
    @required this.username,
  });

  @override
  List<Object> get props => [
    token,
    username,
  ];

  factory TokenCredential.fromJson(Map<String,dynamic> json) {
    return TokenCredential(
      token: json['token'],
      username : json['username'],
    );
  }

  Map<String , dynamic > toJson(){
    return {
      'token':this.token,
      'username':this.username,
    };
  }
  
}