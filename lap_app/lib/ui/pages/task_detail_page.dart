import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/ui/pages/pages.dart';
import 'package:lap_app/ui/widget/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class TaskDetail extends StatelessWidget{

  @override
  Widget build(BuildContext contex){
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Network Configuration',style: TextStyle(color: Colors.black),),
          centerTitle: true,
          backgroundColor: Colors.white,
          bottom: TabBar(
            indicatorColor: const Color(0xff36B772),
            labelColor: Color(0xff69736D),
            tabs: [new Tab(text: 'DETAIL',),new Tab(text: 'DEVICE')]
          ),
      ),

        body: TabBarView(children: <Widget>[
          // Text('Detail na ja')
          buildBodyDetail(contex),
          // Text('Device na ja')
          buildBodyDevice(contex)
        ],),

        bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: 
          RaisedButton(
            color: const Color(0xFF2FDC96),
            shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(8.0),  ),
            textColor: Colors.white,
            onPressed: ()=>print('hello'),
            child: new Text('รับทำงาน', style: TextStyle(fontSize: 20)),
          )
        )
      
      )
    );
  }


}
