import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:lap_app/ui/widget/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class VerifyOtpPage extends StatelessWidget {
  const VerifyOtpPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyOtpBloc(),
      child: VerifyOtpPageChild(),
    );
  }
}

class VerifyOtpPageChild extends StatelessWidget {
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
            child: BlocListener<VerifyOtpBloc, VerifyOtpState>(
                listener: (context, state) {
                  if (state is VerifyOtpTimeout) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('OTP timeout !'),
                      backgroundColor: Colors.orange,
                    ));
                  }
                },
                child: buildBody(context)),
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
        BlocBuilder(
          bloc: BlocProvider.of<VerifyOtpBloc>(context),
          builder: (BuildContext context, state) {
            if (state is VerifyOtpInitial) {
              return OtpInput();
            } else if (state is VerifyOtpLoading || state is VerifyOtpTimeout) {
              return LoadingWidget(width:100,height:100);
            }
          },
        ),
      ]),
    ]);
  }
}
