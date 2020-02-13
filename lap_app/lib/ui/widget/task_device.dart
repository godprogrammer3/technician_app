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
                        height: 78.0,
                        width: 78.0,
                        decoration: new BoxDecoration(
                          // image: DecorationImage(
                          //   image: new AssetImage(
                          //       ''),
                          //   fit: BoxFit.fill,
                          // ),
                          shape: BoxShape.rectangle,
                          color: Colors.black
                        ),
                      ),

                      Container(
                        child: Column(
                          children: <Widget>[
                            Text('${nameDevice[index]}'),
                            Text('รุ่นอุปกรณ์ : ${modelDevice[index]} '),
                            Text('TYPE : ${typeDevice[index]}'),
                          ],
                        ),

                      ),

                      Container(
                          child: IconButton(iconSize: 44.0,icon: Icon(Icons.arrow_right),onPressed: null,),
                      )
                    ],
                  )

                  // Center(child: Text('Entry ${entries[index]}'))
                );
              },
              separatorBuilder: (BuildContext context, int index) => const Divider(),
            );
  }