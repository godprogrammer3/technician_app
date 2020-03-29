part of 'request_otp_bloc.dart';

abstract class RequestOtpEvent extends Equatable {
  const RequestOtpEvent();
}

class RequestOtp extends RequestOtpEvent {
  final UserCredential userCredential;

  RequestOtp({this.userCredential});
  @override
  List<Object> get props => [userCredential];
}


