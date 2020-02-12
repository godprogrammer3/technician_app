import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:lap_app/models/models.dart';
import 'package:lap_app/core/status/status.dart';
part 'request_otp_event.dart';
part 'request_otp_state.dart';

class RequestOtpBloc extends Bloc<RequestOtpEvent, RequestOtpState> {
  final requestOtpModel = RequestOtpModel();
  @override
  RequestOtpState get initialState => RequestOtpInitial();

  @override
  Stream<RequestOtpState> mapEventToState(
    RequestOtpEvent event,
  ) async* {
    // TODO: Add Logic
    yield RequestOtpLoading();
    if (event is RequestOtp) {
      try {
        final otpCredential = await requestOtpModel.requestOtp(event.userCredential);
        yield RequestOtpSuccess(otpCredential:otpCredential);
      } on AuthenError {
        yield RequestOtpError(
            message: "Username is incorrect!", color: Colors.red);
        await Future.delayed(Duration(seconds: 1));
        yield RequestOtpInitial();
      } on ServerError {
        yield RequestOtpError(message: "Server error!", color: Colors.red);
        await Future.delayed(Duration(seconds: 1));
        yield RequestOtpInitial();
      } on InternetError {
        yield RequestOtpError(message: "Internet error!", color: Colors.red);
        await Future.delayed(Duration(seconds: 1));
        yield RequestOtpInitial();
      }
    }
  }
}
