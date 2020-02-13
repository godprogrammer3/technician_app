import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:lap_app/ui/pages/pages.dart';
import 'package:lap_app/ui/pages/wait_task.dart';
import 'dart:async';

import 'data/entities/entities.dart';
// cil2
import 'package:lap_app/data/datasources/datasources.dart';
// cil
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
  // final assetResources = AssetResources();
  // try{
  //   final jsonString= await assetResources.loadJsonString('search_result_job.json');
  //   try{
  //     final json1 =  json.decode(jsonString[0]);
  //     print(json1);
  //   }catch(e){
  //     print(e);
  //   }
    
    
  // }catch(e){
  //   print(e);
  // }

}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab App Dev',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: SplashPage(),//SearchResultPage
    );
  }
}
