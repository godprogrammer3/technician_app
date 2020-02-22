import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:lap_app/ui/pages/pages.dart';
import 'package:lap_app/ui/widget/widgets.dart';

class VerifyOtpPage extends StatelessWidget {
  final OtpCredential otpCredential;
  const VerifyOtpPage({Key key, this.otpCredential}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyOtpBloc(),
      child: VerifyOtpPageChild(otpCredential: this.otpCredential),
    );
  }
}

class VerifyOtpPageChild extends StatelessWidget {
  final OtpCredential otpCredential;

  const VerifyOtpPageChild({Key key, this.otpCredential}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      body: SafeArea(
          left: true,
          top: true,
          right: true,
          bottom: true,
          minimum: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: BlocListener<VerifyOtpBloc, VerifyOtpState>(
                listener: (context, state) {
                  if (state is VerifyOtpError) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text(state.message),
                      backgroundColor: state.color,
                    ));
                  } else if (state is VerifyOtpSuccess) {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return  HomePage(tokenCredential: state.tokenCredential);
                    }));
                  }
                },
                child: buildBody(context, this.otpCredential)),
          )),
    );
  }

  Widget buildBody(BuildContext context, OtpCredential otpCredential) {
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
        BlocBuilder(
          bloc: BlocProvider.of<VerifyOtpBloc>(context),
          builder: (BuildContext context, state) {
            if (state is VerifyOtpInitial) {
              if (state.time == null) {
                return OtpInput(
                    otpCredential: this.otpCredential,
                    time: Time(minutes: 5, seconds: 0));
              } else {
                return OtpInput(
                    otpCredential: this.otpCredential, time: state.time);
              }
            } else {
              return LoadingWidget(width: 100, height: 100);
            }
          },
        ),
      ]),
    ]);
  }
}
