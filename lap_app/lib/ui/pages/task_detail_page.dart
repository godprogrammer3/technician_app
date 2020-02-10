import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/ui/pages/pages.dart';
import 'package:lap_app/ui/widget/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class TaskDetail extends StatelessWidget{

  
  @override
  Widget build(BuildContext contex){
    return 
    Scaffold(
      appBar: AppBar(
        title: const Text('Network Configuration'),
        backgroundColor: const Color(0xFF2FDC96),
        // bottom: TabBar(
          // tabs: <Widget>[
          //   Text('hey'),
          //   Text('hi')
          // ],
        // ),
        ),

      body: SingleChildScrollView(
        child: buildBody(contex),
      ),

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
    );
  }


  Widget buildBody(BuildContext contex){
      return  Stack(
        children:<Widget>[
          Align(
            alignment:Alignment.center,
            child: 
              Text(
                'Hello',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.bold),
              )

          ),

        ],
        overflow: Overflow.visible,
      );
  }
}
