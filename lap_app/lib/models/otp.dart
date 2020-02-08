import 'package:equatable/equatable.dart';

class Otp extends Equatable{
  final String otpCode;
  Otp(this.otpCode);
  @override
  // TODO: implement props
  List<Object> get props => [otpCode];

}