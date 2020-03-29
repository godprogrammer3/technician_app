import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lap_app/data/datasources/datasources.dart';
import 'package:meta/meta.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  @override
  HomeState get initialState => HomeInitial();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    if (event is HomeErrorEvent) {
      yield HomeErrorState(
        message: event.message,
        color: event.color,
      );
      await Future.delayed(Duration(seconds: 1));
      yield HomeInitial();
    } else if (event is HomeSearchEvent) {
      yield HomeLoadingState();
      try {
        final assets = AssetResources();
        final jobs = await assets.loadJson('search_result_job.json');
        yield HomeGotoSearchPage(
          searchString: event.searchString,
          jobs: jobs,
        );
      } catch (e) {
        yield HomeErrorState(
          message: e.toString(),
          color: Colors.red,
        );
      }
      yield HomeInitial();
    }else if(event is HomeChangePageEvent){
      yield HomeChangePageState(pageIndex: event.pageIndex);
    }
  }
}
