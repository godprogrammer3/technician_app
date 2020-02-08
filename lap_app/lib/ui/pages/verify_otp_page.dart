import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:lap_app/ui/widget/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

String currentOtp = '';

class VerifyOtpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          left: true,
          top: true,
          right: true,
          bottom: true,
          minimum: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: buildBody(context),
          )),
    );
  }

  Widget buildBody(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        ImageDisplay(
            imageName: 'top_verify_otp.svg',
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.height * 0.3),
        Text(
          'Verification',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0),
        ),
        SizedBox(height: 20),
        Container(
          width: 200,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Text(
                  'Enter a 4 digit number \nthat we sent to\n+ (66)81 234 5678',
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.grey,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 40),
        OtpInput(),
      ]),
    ]);
  }
}

