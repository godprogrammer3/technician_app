import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'templete_event.dart';
part 'templete_state.dart';

class TempleteBloc extends Bloc<TempleteEvent, TempleteState> {
  @override
  TempleteState get initialState => TempleteInitial();

  @override
  Stream<TempleteState> mapEventToState(
    TempleteEvent event,
  ) async* {
    // TODO: Add Logic
  }
}
