import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';

  Widget buildBodyDetail(BuildContext contex){
    var nameCustomer = "PTT";
    var nameProject = "eieieieiei";
    var detailJob = "Hello za haha +";

      return  ListView(
        scrollDirection: Axis.vertical,
        children:<Widget>[
          Align(
            alignment:Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('รายละเอียดโปรเจค'),
                    
                  ),
                // SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(10),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('ชื่อลูกค้า : $nameCustomer'),
                          Text('Project : $nameProject'),
                        ],
                      ),
                    ) 
                  ),
      
                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('รายละเอียดงาน'),
                  ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: Text('$detailJob'),
                  )

              ],
            )
          ),
        ],
      );
  }