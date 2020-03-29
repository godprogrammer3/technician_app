import 'dart:async';

import 'package:lap_app/data/datasources/datasources.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:lap_app/ui/widget/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:lap_app/ui/pages/pages.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  TokenCredential tokenCredential;
  Timer timer;
  bool _isValidtoken = false;
  BuildContext _context;
  final networkResource = NetworkResource();
  @override
  void initState() {
    super.initState();
    timer = new Timer(const Duration(seconds: 2), onFinished);
    checkToken();
  }
  @override
  void dispose(){
    timer.cancel();
    super.dispose();
  }
  void checkToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    final uid = prefs.getString('uid');
    if (token == null || uid == null) {
      _isValidtoken = false;
    } else {
      try {
        tokenCredential = await networkResource
            .checkLogin(TokenCredential(token: token, uid: uid));
        _isValidtoken = true;
        print(token);
        print(uid);
        print('success');
      } catch (e) {
        _isValidtoken = false;
        print('failed');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _context = context;
    return Scaffold(
        body: SafeArea(
      child: Center(
          child: Container(
        child: Column(children: <Widget>[
          SizedBox(height: MediaQuery.of(context).size.height*0.2),
          ImageDisplay(
              imageName: 'aislogo.png',
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.6),
        SizedBox(height:100),
        LoadingWidget(width: MediaQuery.of(context).size.width * 0.2,height:MediaQuery.of(context).size.width * 0.2)
        ]),
      )),
    ));
  }

  void onFinished() async {
    if (_isValidtoken == true) {
      Navigator.of(_context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) {
          return HomePage(tokenCredential: tokenCredential);
        }
      ));
    } else {
        Navigator.of(_context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) {
          return RequestOtpPage();
        }
      ));
    }
  }
}
