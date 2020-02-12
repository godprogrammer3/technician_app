import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider(
        create: (context) => SearchResultBloc(),
        child: SearchResultPageChild(),
      ),
    );
  }
}

class SearchResultPageChild extends StatelessWidget {
  const SearchResultPageChild({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context){
    return Column(
      children: <Widget>[
        Row(
          
        ),  
    ]);
  }
}