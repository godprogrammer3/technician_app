import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:http/http.dart' as http;
import 'package:lap_app/core/network/network_info.dart';
import 'package:lap_app/core/status/status.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'dart:convert';

class NetworkResource extends Equatable {
  final networkInfo = NetworkInfoImpl();
  NetworkResource();
  @override
  List<Object> get props => null;

  Future<OtpCredential> requestOtp(UserCredential userCredential) async {
    if (await networkInfo.isConnected) {
      const String url = 'http://lapais.cloud:54002/lapapp/api/requestOtp';
      try {
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(userCredential.toJson()),
        );
        if (response.statusCode == 200) {
          return OtpCredential.fromJson({
            'username':userCredential.username,
            'uuid':userCredential.uuid,
            'otp':json.decode(response.body)['otp'],
          });
        } else if (response.statusCode == 500) {
          throw AuthenError();
        } else {
          throw ServerError();
        }
      } on SocketException {
        throw InternetError();
      }
    } else {
      throw InternetError();
    }
  }

  Future<TokenCredential> getToken(OtpCredential otpCredential) async {
    if (await networkInfo.isConnected) {
      const String url = 'http://lapais.cloud:54002/lapapp/api/submitOtp';
      try {
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
          },
          body: jsonEncode(otpCredential.toJson()),
        );
        
        if (response.statusCode == 200) {
          return TokenCredential.fromJson({'token':json.decode(response.body)['token'],'uid':otpCredential.uuid});
        } else if (response.statusCode == 400) {
          throw AuthenError();
        } else {
          throw ServerError();
        }
      } on SocketException {
        throw InternetError();
      }
    } else {
      throw InternetError();
    }
  }

  Future<TokenCredential> checkLogin(TokenCredential tokenCredential) async {
    if (await networkInfo.isConnected) {
      const String url = 'http://lapais.cloud:54002/lapapp/api/requestLogin';
      try {
        final response = await http.post(
          url,
          headers: {
            'Content-Type': 'application/json',
            'BlueToken':tokenCredential.token,
            'LapId':tokenCredential.uid
          },
        );

        if (response.statusCode == 200) {
          return tokenCredential;
        } else if (response.statusCode == 400) {
          throw AuthenError();
        } else {
          throw ServerError();
        }
      } on SocketException {
        throw InternetError();
      }
    } else {
      throw InternetError();
    }
  }

  
}
