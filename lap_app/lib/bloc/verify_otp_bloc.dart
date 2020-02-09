import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:lap_app/core/status/status.dart';
import 'package:lap_app/data/datasources/datasources.dart';
import 'package:lap_app/data/entities/entities.dart';
part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  NetworkResource networkResource = NetworkResource();
  @override
  VerifyOtpState get initialState => VerifyOtpInitial();

  @override
  Stream<VerifyOtpState> mapEventToState(
    VerifyOtpEvent event,
  ) async* {
    // TODO: Add Logic
    if (event is GetTokenEvent) {
      yield VerifyOtpLoading();
      try {
        final tokenCredential =
            await networkResource.getToken(event.otpCredential);
        yield VerifyOtpIncorrect();
        yield VerifyOtpInitial();
      } on AuthenError {
        yield VerifyOtpIncorrect();
        await Future.delayed(Duration(seconds: 1));
        yield VerifyOtpInitial();
      } on ServerException {
        yield VerifyOtpServerError();
        await Future.delayed(Duration(seconds: 1));
        yield VerifyOtpInitial();
      }
    } else if (event is OtpTimeoutEvent) {
      yield VerifyOtpTimeout();
      yield VerifyOtpLoading();
      await Future.delayed(Duration(seconds: 1));
      yield VerifyOtpInitial();
    }
  }
}
