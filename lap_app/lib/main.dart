import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:lap_app/ui/pages/pages.dart';
import 'dart:async';

import 'data/entities/entities.dart';
import 'package:lap_app/data/datasources/datasources.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab App Dev',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: RequestOtpPage(),
    );
  }
}
