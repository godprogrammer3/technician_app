import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';

class OtpInput extends StatelessWidget {
  final OtpCredential otpCredential;
  final Time time;

  const OtpInput({Key key, this.otpCredential, this.time}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            width: 300,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                  topLeft: const Radius.circular(10.0),
                  topRight: const Radius.circular(10.0),
                  bottomLeft: const Radius.circular(10.0),
                  bottomRight: const Radius.circular(10.0),
                ),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.shade400,
                      offset: Offset(1, -2),
                      blurRadius: 5),
                  BoxShadow(
                      color: Colors.grey.shade400,
                      offset: Offset(-1, 2),
                      blurRadius: 5)
                ]),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  PinInput(otpCredential: this.otpCredential, time: time),
                  SizedBox(height: 15),
                ])),
        SizedBox(height: 20),
        OtpCountDown(time: time, otpCredential: this.otpCredential),
      ],
    );
  }
}

class PinInput extends StatefulWidget {
  final OtpCredential otpCredential;
  final Time time;
  const PinInput({Key key, this.otpCredential, this.time}) : super(key: key);
  @override
  _PinInputState createState() =>
      new _PinInputState(otpCredential: this.otpCredential, time: this.time);
}

class _PinInputState extends State<PinInput> {
  String currentOtp;
  Color buttonColor = Colors.grey[300];
  TextEditingController txtController = TextEditingController();
  final Time time;
  final OtpCredential otpCredential;
  _PinInputState({this.otpCredential, this.time});
  @override
  void initState() {
    super.initState();
    Timer(new Duration(seconds: 10), () {
      _autoFillOtp();
    });
  }

  @override
  void dispose(){   
    super.dispose();
  }

  void _autoFillOtp() {
    if(this.mounted){
      txtController.text = otpCredential.otp;
    }
   
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        padding: EdgeInsets.all(0),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
            child: new PinCodeTextField(
              length: 4,
              obsecureText: false,
              animationType: AnimationType.fade,
              shape: PinCodeFieldShape.underline,
              animationDuration: Duration(milliseconds: 300),
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 60,
              fieldWidth: 40,
              backgroundColor: Colors.white,
              textStyle: TextStyle(fontSize: 28),
              textInputType: TextInputType.numberWithOptions(
                  signed: false, decimal: false),
              inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
              inactiveColor: Colors.grey,
              controller: txtController,
              onChanged: (value) {
                setState(() {
                  currentOtp = value;
                  if (currentOtp.length == 4) {
                    buttonColor = Color.fromARGB(255, 47, 220, 150);
                  } else {
                    buttonColor = Colors.grey[300];
                  }
                });
              },
            )),
      ),
      SizedBox(height: 20),
      MaterialButton(
          height: 50,
          minWidth: 250,
          color: buttonColor,
          textColor: Colors.white,
          child: Text('Verify'),
          onPressed: () {
            if (currentOtp != null && currentOtp.length == 4) {
              final verifyOtpBloc = BlocProvider.of<VerifyOtpBloc>(context);
              verifyOtpBloc.add(
                  GetTokenEvent(otpCredential: OtpCredential(
                    username:this.otpCredential.username,
                    uuid: this.otpCredential.uuid,
                    otp: txtController.text,
                  ), time: time));
            }
          },
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(30.0),
              side: BorderSide(color: Colors.transparent))),
    ]);
  }
}

class OtpCountDown extends StatefulWidget {
  final Time time;
  final OtpCredential otpCredential;
  OtpCountDown({Key key, this.time, this.otpCredential}) : super(key: key);

  @override
  _OtpCountDownState createState() =>
      _OtpCountDownState(time: time, otpCredential: this.otpCredential);
}

class _OtpCountDownState extends State<OtpCountDown> {
  Timer timer;
  int minutes;
  int seconds;
  final Time time;
  final OtpCredential otpCredential;
  _OtpCountDownState({this.time, this.otpCredential});
  @override
  void initState() {
    super.initState();
    minutes = time.minutes;
    seconds = time.seconds;
    timer = Timer.periodic(new Duration(seconds: 1), (timer) {
      _countDown();
    });
  }

  void _countDown() {
    if (this.mounted) {
      if (seconds == 0 && minutes == 0) {
        final verifyOtpBloc = BlocProvider.of<VerifyOtpBloc>(context);
        verifyOtpBloc.add(OtpTimeoutEvent(otpCredential: this.otpCredential));
        minutes = 5;
        seconds = 0;
      } else {
        seconds--;
        if (seconds < 0) {
          seconds = 59;
          minutes--;
        }
      }
      setState(() {
        minutes = minutes;
        seconds = seconds;
        time.minutes = minutes;
        time.seconds = seconds;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
          "Re-Send code in " +
              (minutes > 0 ? minutes.toString() + " : " : "") +
              "$seconds",
          style: TextStyle(
            color: Color.fromARGB(255, 47, 220, 150),
            fontSize: 16,
          )),
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }
}
