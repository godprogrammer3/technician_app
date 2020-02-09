import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:lap_app/core/network/network_info.dart';
import 'package:lap_app/core/status/status.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'dart:convert';

class NetworkResource extends Equatable {
  NetworkResource();
  @override
  // TODO: implement props
  List<Object> get props => null;

  Future<OtpCredential> requestOtp(UserCredential userCredential) async {
    const String url = 'http://lapais.cloud:54002/lapapp/api/requestOtp';
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode(userCredential.toJson()),
    );

    if (response.statusCode == 200) {
      return OtpCredential.fromJson(json.decode(response.body));
    } else if (response.statusCode == 400) {
      throw AuthenError();
    } else {
      throw ServerError();
    }
  }

  Future<TokenCredential> getToken(OtpCredential otpCredential) async {
    final NetworkInfo networkInfo = NetworkInfoImpl();
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
          return TokenCredential.fromJson(json.decode(response.body));
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
