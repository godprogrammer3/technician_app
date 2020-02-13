import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';

  Widget buildBodyDevice(BuildContext contex){
      final List<String> entries = <String>['A', 'B', 'C'];
      final List<int> colorCodes = <int>[600, 500, 100];

      List<String> nameDevice = <String>['ABC','DEF','GHI'];
      List<String> modelDevice = <String>['123','456','789'];
      List<String> typeDevice = <String>['Switch','Lab','Multimeter'];

      return ListView.separated(
              padding: const EdgeInsets.all(8),
              itemCount: nameDevice.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  // height: 50,
                  // color: Colors.amber[colorCodes[index]],
                  child: Row(
                    
                    children: <Widget>[

                      Container(
                        margin: EdgeInsets.all(16),
                        height: 78.0,
                        width: 78.0,
                        decoration: new BoxDecoration(
                          // image: DecorationImage(
                          //   image: new AssetImage(
                          //       ''),
                          //   fit: BoxFit.fill,
                          // ),
                          shape: BoxShape.rectangle,
                          color: Colors.blueGrey
                        ),
                      ),

                      Expanded(
                        
                        child: Column(
                          children: <Widget>[
                            Align(alignment: Alignment.centerLeft,child:  Text('${nameDevice[index]}')),
                            Align(alignment: Alignment.centerLeft,child:  Text('รุ่นอุปกรณ์ : ${modelDevice[index]} '),),
                            Align(alignment: Alignment.centerLeft,child:  Text('TYPE : ${typeDevice[index]}'),),
                          ],
                          
                        ),

                      ),

                      Container(
                        margin: EdgeInsets.all(16),
                          child: IconButton(iconSize: 44.0,icon: Icon(Icons.keyboard_arrow_right),onPressed: null,),
                      )
                    ],
                  )

                  // Center(child: Text('Entry ${entries[index]}'))
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            );
  }