import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/login_bloc.dart';

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext contex){
    return Scaffold(
      body: SingleChildScrollView(
        child: buildBody(contex),
      )
    );
  }
  BlocProvider<LoginState> buildBody(BuildContext contex){
    return BlocProvider(
      create: (_) => sl<LoginState>(),
      child: Center(
        
        child: Column(
          children: <Widget>[
            Image.asset("assets/logo.png")
          ],
        ),
        )
        
      )
    )
  }
}
