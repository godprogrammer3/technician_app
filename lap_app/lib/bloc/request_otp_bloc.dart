import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'request_otp_event.dart';
part 'request_otp_state.dart';

class RequestOtpBloc extends Bloc<RequestOtpEvent, RequestOtpState> {
  @override
  RequestOtpState get initialState => RequestOtpInitial();

  int _counter = 0;

  @override
  Stream<RequestOtpState> mapEventToState(
    RequestOtpEvent event,
  ) async* {
    // TODO: Add Logic\
  
  }
}
