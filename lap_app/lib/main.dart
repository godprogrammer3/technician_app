import 'package:flutter/material.dart';
import 'package:lap_app/ui/pages/pages.dart';



void main() {
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab App Dev',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: VerifyOtpPage(),
    );
  }
}

