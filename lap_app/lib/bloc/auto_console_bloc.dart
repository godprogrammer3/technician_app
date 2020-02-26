import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lap_app/models/models.dart';

part 'auto_console_event.dart';
part 'auto_console_state.dart';

class AutoConsoleBloc extends Bloc<AutoConsoleEvent, AutoConsoleState> {
  @override
  AutoConsoleState get initialState => AutoConsoleInitial();
  final consoleModel = new ConsoleModel();
  @override
  Stream<AutoConsoleState> mapEventToState(
    AutoConsoleEvent event,
  ) async* {
    if( event is AutoConsoleStartEvent){
      try{
        await consoleModel.connect(event.callBackFunction);
        yield AutoConsoleStartState(consoleModel:consoleModel);
      }catch(e){
        yield AutoConsoleErrorState(
          message:e.message
        );
      }
    }else if( event is AutoConsoleInitialEvent){
      yield AutoConsoleInitial();
    }
  }
}
