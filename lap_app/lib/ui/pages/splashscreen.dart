import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:lap_app/ui/pages/pages.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 2,
        navigateAfterSeconds: RequestOtpPage(),
        image: Image.asset('assets/images/aislogo.png'),
        backgroundColor: Color(0xfafafa),
        //styleTextUnderTheLoader: TextStyle(color: Colors.deepPurple),
        photoSize: 90.0,
        loaderColor: Colors.green);
  }
}