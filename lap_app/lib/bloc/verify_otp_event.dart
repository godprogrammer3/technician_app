part of 'verify_otp_bloc.dart';

abstract class VerifyOtpEvent extends Equatable {
  const VerifyOtpEvent();
}

class LodingEvent extends VerifyOtpEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class GetTokenEvent extends VerifyOtpEvent {
  final OtpCredential otpCredential;
  GetTokenEvent({this.otpCredential});
  @override
  // TODO: implement props
  List<Object> get props => [otpCredential];

}

class OtpTimeoutEvent extends VerifyOtpEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;

}


