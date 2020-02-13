import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'your_task_event.dart';
part 'your_task_state.dart';

class YourTaskBloc extends Bloc<YourTaskEvent, YourTaskState> {
  @override
  YourTaskState get initialState => YourTaskInitial();

  @override
  Stream<YourTaskState> mapEventToState(
    YourTaskEvent event,
  ) async* {
    if( event is YourTaskChangePageEvent){
      yield YourTaskChangePageState(
        pageIndex: event.pageIndex,
      );
    }
  }
}
