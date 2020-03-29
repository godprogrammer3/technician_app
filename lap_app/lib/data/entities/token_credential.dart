import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class TokenCredential extends Equatable{

  final String token;
  final String uid;
  TokenCredential({
    @required this.token,
    @required this.uid,
  });

  @override
  List<Object> get props => [
    token,
    uid,
  ];

  factory TokenCredential.fromJson(Map<String,dynamic> json) {
    return TokenCredential(
      token: json['token'],
      uid : json['uid'],
    );
  }

  Map<String , dynamic > toJson(){
    return {
      'token':this.token,
      'uid':this.uid,
    };
  }
  
}