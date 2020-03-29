import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:lap_app/data/datasources/datasources.dart';
import 'package:meta/meta.dart';
part 'list_item_event.dart';
part 'list_item_state.dart';

class ListItemBloc extends Bloc<ListItemEvent, ListItemState> {
  final assetResources = new AssetResources();
  @override
  ListItemState get initialState {
    return ListItemInitial();
  }
  @override
  Stream<ListItemState> mapEventToState(
    ListItemEvent event,
  ) async* {
    if(event is ListItemInitialEvent){
      try{
        final resultString = await assetResources.loadRawString('img_base64.txt');
        yield ListItemCompletedState(img: base64.decode(resultString),title: 'Title',content:'content');
      }catch(e){
        print(e.toString());
        yield ListItemErrorState();
      }
    }
  }
}
