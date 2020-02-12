part of 'request_otp_bloc.dart';
abstract class RequestOtpState extends Equatable {
  const RequestOtpState();
}

class RequestOtpInitial extends RequestOtpState {
  @override
  List<Object> get props => [];
}

class RequestOtpLoading extends RequestOtpState {
  @override
  // TODO: implement props
  List<Object> get props => null;

}

class RequestOtpSuccess extends RequestOtpState {
  final OtpCredential otpCredential;

  RequestOtpSuccess({@required this.otpCredential});
  @override
  // TODO: implement props
  List<Object> get props => null;

}
class RequestOtpError extends RequestOtpState {
  final String message;
  final Color color;

  RequestOtpError({
    @required this.message, 
    @required this.color,
    });

  @override
  // TODO: implement props
  List<Object> get props => null;
}