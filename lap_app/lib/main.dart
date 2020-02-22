import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lap_app/ui/pages/pages.dart';
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
      title: 'Lab App',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: ConsolePage(),
    );
  }
}
