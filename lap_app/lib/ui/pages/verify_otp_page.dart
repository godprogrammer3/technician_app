import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';

class VerifyOtpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Verify OTP page'),
      // ),
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
        SizedBox(height: MediaQuery.of(context).size.height / 9),
        Container(
          width: MediaQuery.of(context).size.width - 100,
          height: 200,
          child: Image.asset(
            'assets/images/verify_otp_tp.png',
            fit: BoxFit.fitWidth,
          ),
        ),
        Text(
          'Verification',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        Text('Enter A 4 Digit Numer That We Sent To + (66)81 234 5678'),
        SizedBox(height: 20),
        Text('otp verify widget'),
        SizedBox(height: 20),
        Text('Re-Send Code in 0:59', style: TextStyle(color: Colors.green)),
      ]),
    ]);
  }
}
