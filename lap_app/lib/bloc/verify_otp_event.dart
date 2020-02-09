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
  final String otpCode;
  final String username;
  GetTokenEvent(this.otpCode);
  @override
  // TODO: implement props
  List<Object> get props => [otpCode];

}

class OtpTimeoutEvent extends VerifyOtpEvent{
  @override
  // TODO: implement props
  List<Object> get props => null;

}


