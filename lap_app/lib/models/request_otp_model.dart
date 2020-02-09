import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:lap_app/core/status/status.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:meta/meta.dart';
class RequestOtpModel extends Equatable{
  final UserCredential userCredential;

  RequestOtpModel(
    @required this.userCredential
  );
  @override
  // TODO: implement props
  List<Object> get props => null;
  Future<Either<Failure,OtpCredential>>requestOtp(){
      
  }
}