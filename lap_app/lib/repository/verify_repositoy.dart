import 'package:lap_app/core/error/error.dart';
import 'package:lap_app/models/models.dart';
import 'package:dartz/dartz.dart';
abstract class VerifyRepository {
  Future<Either<Failure,Token>> getToken(Credential credential);
  Future<Either<Failure,Otp>> requestOtp(Credential credential);
}



