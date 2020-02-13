import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:lap_app/data/entities/entities.dart';

class AssetResources {
  Future< List<dynamic>> loadJsonString(String fileName) async {
    try{
      final jsonString = await rootBundle.loadString('assets/data/'+fileName);
      return json.decode(jsonString);  
    }catch(e){
      print(e);
      throw Error();
    }
      
  }

  Future<List<Job> > loadJobList(String fileName) async {
    try{
      final jsonString = await rootBundle.loadString('assets/data/'+fileName);
      final jsonList = json.decode(jsonString);
      return jsonList.map((i)=> Equipment.fromJson(i)).toList();
    }catch(e){
      print(e);
      throw Error();
    }
  }
}