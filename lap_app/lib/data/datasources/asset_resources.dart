


import 'dart:convert';

import 'package:flutter/services.dart';

class AssetResources {
  Future< List<dynamic>> loadJssonString(String fileName) async {
    try{
      final jsonString = await rootBundle.loadString('assets/data/'+fileName);
      return json.decode(jsonString);  
    }catch(e){
      print('Parse file error');
      print(e.message);
      throw Error();
    }
    
  }
}