part of 'verify_otp_bloc.dart';
abstract class VerifyOtpState extends Equatable {
  const VerifyOtpState();
}

class VerifyOtpInitial extends VerifyOtpState {
  final Time time;
  final OtpCredential otpCredential;
  VerifyOtpInitial({this.time,this.otpCredential});
  @override
  List<Object> get props => [];
}

class VerifyOtpLoading extends VerifyOtpState {
  @override
  List<Object> get props => null;
  
}

class VerifyOtpError extends VerifyOtpState {
  final String message;
  final Color color;
  VerifyOtpError({
    @required this.message,
    @required this.color,
    });
  @override

  List<Object> get props => null;

}

class VerifyOtpSuccess extends VerifyOtpState{
  final TokenCredential tokenCredential;

  VerifyOtpSuccess({
    @required this.tokenCredential,
    });
  @override
  List<Object> get props => [tokenCredential];

}
