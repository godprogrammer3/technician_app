import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:meta/meta.dart';
part 'wait_task_event.dart';
part 'wait_task_state.dart';

class WaitTaskBloc extends Bloc<WaitTaskEvent, WaitTaskState> {
  @override
  WaitTaskState get initialState => WaitTaskInitial();

  @override
  Stream<WaitTaskState> mapEventToState(
    WaitTaskEvent event,
  ) async* {
    if( event is WaitTaskChangePageEvent){
      yield WaitTaskChangePageState(
        pageIndex: event.pageIndex,
      );
    }
  }
}
