import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:lap_app/core/status/status.dart';
import 'package:lap_app/data/datasources/datasources.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:lap_app/models/models.dart';
part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  VerifyOtpModel verifyOtpModel = new VerifyOtpModel();
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
            await verifyOtpModel.getToken(event.otpCredential);
        yield VerifyOtpError(message: "OTP is correct!", color: Colors.green);
        yield VerifyOtpInitial(time:event.time);
      } on AuthenError {
        yield VerifyOtpError(message: "OTP is incorrect!", color: Colors.red);
        await Future.delayed(Duration(seconds: 1));
        yield VerifyOtpInitial(time:event.time);
      } on ServerError {
        yield VerifyOtpError(message: "Server error!", color: Colors.red);
        await Future.delayed(Duration(seconds: 1));
        yield VerifyOtpInitial(time:event.time);
      } on InternetError {
        yield VerifyOtpError(message: "Internet error!", color: Colors.red);
        await Future.delayed(Duration(seconds: 1));
        yield VerifyOtpInitial(time:event.time);
      }
    } else if (event is OtpTimeoutEvent) {
      yield VerifyOtpError(message: "OTP timeout otp was resend", color: Colors.orange);
      yield VerifyOtpLoading();
      await Future.delayed(Duration(seconds: 1));
      yield VerifyOtpInitial();
    }
  }
}
