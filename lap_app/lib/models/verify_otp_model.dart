import 'package:equatable/equatable.dart';
import 'package:lap_app/data/datasources/datasources.dart';
import 'package:lap_app/data/entities/entities.dart';

class VerifyOtpModel extends Equatable{
  final NetworkResource networkResource = new NetworkResource();
  @override
  // TODO: implement props
  List<Object> get props => null;
  
  Future< TokenCredential > getToken(OtpCredential otpCredential) async {
    return await networkResource.getToken(otpCredential);
  }
  
}