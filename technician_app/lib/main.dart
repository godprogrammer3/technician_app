import 'package:flutter/material.dart';
import 'package:technician_app/ui/pages/Pages.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Tecnicain App'),
        ),
        body: LoginPage()
        )
      );
  }
  
}
