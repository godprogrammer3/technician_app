import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:lap_app/data/datasources/datasources.dart';
import 'package:meta/meta.dart';
part 'search_result_event.dart';
part 'search_result_state.dart';

class SearchResultBloc extends Bloc<SearchResultEvent, SearchResultState> {
  @override
  SearchResultState get initialState => SearchResultInitial();

  @override
  Stream<SearchResultState> mapEventToState(
    SearchResultEvent event,
  ) async* {
    if (event is SearchResultErrorEvent) {
      yield SearchResultErrorState(
        message: event.message,
        color: event.color,
      );
      await Future.delayed(Duration(seconds: 1));
      yield SearchResultInitial();
    } else if (event is SearchResultSearchEvent) {
      yield SearchResultLoadingState();
      try{
        final assets = AssetResources();
        final jobs = await assets.loadJson('search_result_job.json');
        yield SearchResultRebuildState(
          jobs: jobs,
        );
      }catch(e){
        yield SearchResultErrorState(
        message: e.toString(),
        color: Colors.red,
      );
      }
      
    }else if( event is SearchResultBackPageEvent){
      yield SearchResultBackPageState(); 
    }else if( event is GotoDetailJobEvent){
      yield GotoDetailJobState();
      yield  SearchResultInitial();
    }
  }
}
