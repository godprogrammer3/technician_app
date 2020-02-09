import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
class OtpCredential extends Equatable{
  final String username;
  final String uuid;
  final String otp;
  OtpCredential({ 
    @required this.username, 
    @required this.uuid, 
    @required this.otp, 
  });

  @override
  // TODO: implement props
  List<Object> get props => [
    username,
  ];

  factory OtpCredential.fromJson(Map<String,dynamic> json) {
    return OtpCredential(
      username : json['username'],
      uuid: json['uuid'],
      otp : json['otp'],
    );
  }

  Map<String , dynamic > toJson(){
    return {
      'username':username,
      'uuid':uuid,
      'otp':otp,
    };
  }
  
}