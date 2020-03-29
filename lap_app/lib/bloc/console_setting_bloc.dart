import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'console_setting_event.dart';
part 'console_setting_state.dart';

class ConsoleSettingBloc
    extends Bloc<ConsoleSettingEvent, ConsoleSettingState> {
  @override
  ConsoleSettingState get initialState => ConsoleSettingInitial();

  @override
  Stream<ConsoleSettingState> mapEventToState(
    ConsoleSettingEvent event,
  ) async* {
    if (event is ConsoleSettingInitEvent) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var baudrateValue = prefs.getInt('baudrateValue');
      if (baudrateValue == null) {
        baudrateValue = 9600;
        await prefs.setInt('baudrateValue', baudrateValue);
      }
      var dataBitValue = prefs.getInt('dataBitValue');
      if (dataBitValue == null) {
        dataBitValue = 8;
        await prefs.setInt('dataBitValue', dataBitValue);
      }
      var parityValue = prefs.getInt('parityValue');
      if (parityValue == null) {
        parityValue = 0;
        await prefs.setInt('parityValue', parityValue);
      }
      var stopBitValue = prefs.getInt('stopBitValue');
      if (stopBitValue == null) {
        stopBitValue = 1;
        await prefs.setInt('stopBitValue', stopBitValue);
      }
      yield ConsoleSettingReadyState(
          consoleSetting: ConsoleSetting(
              baudrateValue: baudrateValue,
              dataBitValue: dataBitValue,
              parityValue: parityValue,
              stopBitValue: stopBitValue),
              );
    }
  }
}
