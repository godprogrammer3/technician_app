import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:lap_app/ui/widget/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        ImageDisplay(imageName:'top_verify_otp.svg',width:MediaQuery.of(context).size.width*0.9,height:MediaQuery.of(context).size.height*0.3),
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
                  onPressed: () => {},
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                      side: BorderSide(color: Colors.transparent))),
            ]));
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
      padding: EdgeInsets.all(0),
      child: Padding(
          padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: PinCodeTextField(
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
            textInputType:
                TextInputType.numberWithOptions(signed: false, decimal: false),
            inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
            onChanged: (value) {
              setState(() {
                currentOtp = value;
              });
            },
          )),
    );
  }
}
