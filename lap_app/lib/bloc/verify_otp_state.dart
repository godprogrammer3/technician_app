part of 'verify_otp_bloc.dart';

abstract class VerifyOtpState extends Equatable {
  const VerifyOtpState();
}

class VerifyOtpInitial extends VerifyOtpState {
  @override
  List<Object> get props => [];
}

class VerifyOtpLoading extends VerifyOtpState {
  @override
  // TODO: implement props
  List<Object> get props => null;
  
}

class VerifyOtpTimeout extends VerifyOtpState {
  @override
  // TODO: implement props
  List<Object> get props => null;
  
}

class VerifyOtpIncorrect extends VerifyOtpState {
  @override
  // TODO: implement props
  List<Object> get props => null;

}

