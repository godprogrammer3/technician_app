import 'package:equatable/equatable.dart';
import 'package:lap_app/data/datasources/datasources.dart';
import 'package:lap_app/data/entities/entities.dart';

class RequestOtpModel extends Equatable{
  final networkResource = NetworkResource();
  @override
  List<Object> get props => [
    networkResource,
  ];
  Future<OtpCredential> requestOtp(UserCredential userCredential) async {
      return await networkResource.requestOtp(userCredential);
  }
}