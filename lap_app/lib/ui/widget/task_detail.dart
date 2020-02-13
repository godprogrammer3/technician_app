import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:flutter/material.dart';

  Widget buildBodyDetail(BuildContext contex){
    var nameCustomer = "PTT";
    var nameProject = "eieieieiei";
    var detailJob = "1. การเพิ่ม vlan และ IP Interface \n\n2. การเพิ่ม Route ให้กับ Controller ทำการใส่ IP Address, \n\nNetwork Mask และรายละเอียดต่างๆ \n\n3. การ NAT IP \n\n4. การทำ DHCP Server \n\n5. การเพิ่ม Radius Server \n\n";

      return  ListView(
        scrollDirection: Axis.vertical,
        children:<Widget>[
          Align(
            alignment:Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                  
                Container(
                  padding: EdgeInsets.only(left: 15,top: 15),
                  child: Text('รายละเอียดโปรเจค',style: TextStyle(fontFamily: 'supermarket',fontSize: 20,color: Colors.black),),
                    
                  ),
                 SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.only(top: 20),
                   color: Colors.white,
                   height: 75,
                    child: Container(
                      margin: EdgeInsets.only(left: 25),
                      //color: Colors.grey,
                      width: double.infinity,
                      height: 70,
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          
                          Text('ชื่อลูกค้า : $nameCustomer',style: TextStyle(fontFamily: 'supermarket',fontSize: 18),),
                          SizedBox(height: 7,),
                          Text('Project : $nameProject',style: TextStyle(fontFamily: 'supermarket',fontSize: 18),),
                        ],
                      ),
                    ) 
                  ),
      
                Container(
                  padding: EdgeInsets.only(left: 15,top: 15),
                  child: Text('รายละเอียดงาน',style: TextStyle(fontFamily: 'supermarket',fontSize: 20),),
                  ),
                  SizedBox(height: 10,),

                Container(
                  padding: EdgeInsets.only(top: 20),
                  color: Colors.white,
                  width: double.infinity,
                  height:500,
                  child: Container(
                      margin: EdgeInsets.only(left: 25),
                      //color: Colors.grey,
                      width: double.infinity,
                      height: 70,
                      child: Column(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          
                          Text('$detailJob',style: TextStyle(fontFamily: 'supermarket',fontSize: 18),),
                        ],
                      ),
                    ) 
                  
                  //Text('$detailJob',style: TextStyle(fontFamily: 'supermarket',fontSize: 18),),
                  )

              ],
            )
          ),
        ],
      );
  }