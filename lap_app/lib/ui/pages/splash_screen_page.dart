import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:lap_app/ui/pages/pages.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 2,
        navigateAfterSeconds: RequestOtpPage(),
        image: Image.asset('assets/images/aislogo.png'),
        backgroundColor: Color(0xfafafa),
        photoSize: 90.0,
        loaderColor: Colors.green);
  }
}