import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';

class OtpInput extends StatelessWidget {
  const OtpInput({Key key}) : super(key: key);

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
                  PinInput(),
                  SizedBox(height: 15),
                  MaterialButton(
                      height: 50,
                      minWidth: 250,
                      color: Color.fromARGB(255, 47, 220, 150),
                      textColor: Colors.white,
                      child: Text('Verify'),
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                          side: BorderSide(color: Colors.transparent))),
                ])),
        SizedBox(height: 20),
        OtpCountDown(),
      ],
    );
  }
}

class PinInput extends StatefulWidget {
  //PinInput({Key key}) : super(key: key);

  @override
  _PinInputState createState() => new _PinInputState();
}

class _PinInputState extends State<PinInput> {
  String currentOtp;
  @override
  void initState() {
    super.initState();
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
              onChanged: (value) {
                setState(() {
                  currentOtp = value;
                });
              },
            )),
      ),
    ]);
  }
}

class OtpCountDown extends StatefulWidget {
  OtpCountDown({Key key}) : super(key: key);

  @override
  _OtpCountDownState createState() => _OtpCountDownState();
}

class _OtpCountDownState extends State<OtpCountDown> {
  Timer timer;
  int minutes;
  int seconds;
  @override
  void initState() {
    super.initState();
    minutes = 0;
    seconds = 20;
    timer = Timer.periodic(new Duration(seconds: 1), (timer) {
      _countDown();
    });
  }

  void _countDown() {
    if (this.mounted) {
      if (seconds == 0 && minutes == 0) {
        final verifyOtpBloc = BlocProvider.of<VerifyOtpBloc>(context);
        verifyOtpBloc.add(OtpTimeoutEvent());
        minutes = 0;
        seconds = 20;
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
