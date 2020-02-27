import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lap_app/ui/pages/pages.dart';
import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';

import 'data/entities/entities.dart';

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
    List<Command> commands = [
      Command(sendCommand: 'auto config',receiveCompleted: 'completed'),
      Command(sendCommand: 'auto config',receiveCompleted: 'completed'),
      Command(sendCommand: 'auto config',receiveCompleted: 'completed')
    ];
    return MaterialApp(
      title: 'Lab App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ConsoleSettingPage(),
    );
  }
}