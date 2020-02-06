import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title : Text("Login"),
      ),
      body :LoginBody()
    );
  }
}


class LoginBody extends StatelessWidget {
  const LoginBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.hashCode / 3,
            child:Text('Start searching')
          ),
        ],
      ),
    );
  }
}