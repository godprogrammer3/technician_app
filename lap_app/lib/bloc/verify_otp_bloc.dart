import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  @override
  VerifyOtpState get initialState => VerifyOtpInitial();

  @override
  Stream<VerifyOtpState> mapEventToState(
    VerifyOtpEvent event,
  ) async* {
    // TODO: Add Logic
    if(event is OtpTimeoutEvent){
      yield VerifyOtpTimeout();
      yield VerifyOtpLoading();
      await Future.delayed(Duration( seconds:5));
      yield VerifyOtpInitial();
    }
  }
}
