import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:lap_app/core/status/status.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:lap_app/models/models.dart';
part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOtpBloc extends Bloc<VerifyOtpEvent, VerifyOtpState> {
  VerifyOtpModel verifyOtpModel = new VerifyOtpModel();
  RequestOtpModel requestOtpModel = new RequestOtpModel();
  @override
  VerifyOtpState get initialState => VerifyOtpInitial();

  @override
  Stream<VerifyOtpState> mapEventToState(
    VerifyOtpEvent event,
  ) async* {
    yield VerifyOtpLoading();
    if (event is GetTokenEvent) {
      try {
        final tokenCredential =
            await verifyOtpModel.getToken(event.otpCredential);
      
        yield VerifyOtpSuccess(tokenCredential:tokenCredential);
      } on AuthenError {
        yield VerifyOtpError(message: "OTP is incorrect!", color: Colors.red);
        await Future.delayed(Duration(seconds: 1));
        yield VerifyOtpInitial(time: event.time);
      } on ServerError {
        yield VerifyOtpError(message: "Server error!", color: Colors.red);
        await Future.delayed(Duration(seconds: 1));
        yield VerifyOtpInitial(time: event.time);
      } on InternetError {
        yield VerifyOtpError(message: "Internet error!", color: Colors.red);
        await Future.delayed(Duration(seconds: 1));
        yield VerifyOtpInitial(time: event.time);
      }
    } else if (event is OtpTimeoutEvent) {
      try {
        final otpCredential = await requestOtpModel.requestOtp(UserCredential(
            username: event.otpCredential.username,
            uuid: event.otpCredential.uuid));
        yield VerifyOtpError(
            message: "OTP timeout otp was resend", color: Colors.orange);
        yield VerifyOtpInitial(otpCredential:otpCredential);
      } on AuthenError {
        yield VerifyOtpError(
            message: "OTP timeout but userid incorrect!", color: Colors.red);
        await Future.delayed(Duration(seconds: 1));
        yield VerifyOtpInitial();
      } on ServerError {
        yield VerifyOtpError(
            message: "OTP timeout but server error!", color: Colors.red);
        await Future.delayed(Duration(seconds: 1));
        yield VerifyOtpInitial();
      } on InternetError {
        yield VerifyOtpError(
            message: "OTP timeout but internet error!", color: Colors.red);
        await Future.delayed(Duration(seconds: 1));
        yield VerifyOtpInitial();
      }
    }
  }
}
