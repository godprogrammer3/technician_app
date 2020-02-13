import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:rounded_floating_app_bar/rounded_floating_app_bar.dart';

class SearchResultPage extends StatelessWidget {
  const SearchResultPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SearchResultBloc(),
        child: SearchResultPageChild(),
      );
  }
}

class SearchResultPageChild extends StatelessWidget {
  const SearchResultPageChild({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding:EdgeInsets.fromLTRB(0, 10, 0, 0),
          child:buildBody(context),
        ),
        
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return  NestedScrollView(
        headerSliverBuilder: (context, isInnerBoxScroll) {
          return [
            RoundedFloatingAppBar(
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.clear,size: 30,),
                  onPressed: () {},
                ),
              ],
              floating: true,
              snap: true,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                 IconButton(
                   icon:Icon(Icons.keyboard_backspace,size:30,),
                   onPressed: () {

                   }
                 ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'ค้นหางานใหม่รอดำเนินการ',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.white,
            ),
          ];
        },
        body: ListView.builder(
          itemBuilder: (_, i) => ListTile(
                title: Text("Title $i"),
              ),
        ),
      );
  }
}
