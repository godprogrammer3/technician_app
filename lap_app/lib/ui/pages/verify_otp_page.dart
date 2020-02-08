import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
String currentOtp = '';
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
        SizedBox(height: MediaQuery.of(context).size.height / 20.0),
        Container(
          width: MediaQuery.of(context).size.width - 70,
          height: 200,
          child: Image.asset(
            'assets/images/verify_otp_tp.png',
            fit: BoxFit.contain,
          ),
        ),
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
        SizedBox(height: 20),
        OtpInput(),
        SizedBox(height: 20),
        Text('Re-Send Code in 0:59',
            style: TextStyle(
              color: Colors.green,
              fontSize: 15.0,
            )),
      ]),
    ]);
  }
}

class OtpInput extends StatelessWidget {
  const OtpInput({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(10.0),
          topRight: const Radius.circular(10.0),
          bottomLeft: const Radius.circular(10.0),
          bottomRight: const Radius.circular(10.0),
        ),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              // Expanded(
              //   child: TextField(
              //       keyboardType: TextInputType.number,
              //       inputFormatters: [
              //         WhitelistingTextInputFormatter.digitsOnly
              //       ],
              //       textAlign: TextAlign.left,
              //       maxLength: 4,
              //       maxLengthEnforced: true,
              //       style: TextStyle(fontSize: 60, letterSpacing: 15)),
              // ),
              Expanded(
                child:PinInput(),
              ),
              
            ]),
            SizedBox(height: 20.0),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              RaisedButton(onPressed: () {}, child: Text('Verify')),
            ])
          ]),
    );
  }
}

class PinInput extends StatefulWidget {
  PinInput({Key key}) : super(key: key);

  @override
  _PinInputState createState() => _PinInputState();
}

class _PinInputState extends State<PinInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PinCodeTextField(
        length: 4,
        obsecureText: false,
        animationType: AnimationType.fade,
        shape: PinCodeFieldShape.box,
        animationDuration: Duration(milliseconds: 300),
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        fieldWidth: 40,
        onChanged: (value) {
          setState(() {
            currentOtp = value;
          });
        },
      ),
    );
  }
}
