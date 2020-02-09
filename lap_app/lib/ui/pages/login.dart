import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/login_bloc.dart';
import 'package:lap_app/ui/widget/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Login extends StatelessWidget{
  @override
  Widget build(BuildContext contex){
  
    return Scaffold(
      body: SingleChildScrollView(
        child: buildBody(contex),
      )
    );
  }
  Widget buildBody(BuildContext contex){
    final TextField _txtusername = new TextField(
      decoration: new InputDecoration(
        hintText:'Enter your username',
        contentPadding: EdgeInsets.only(left:57),
        border: InputBorder.none
        
      ),
      keyboardType:TextInputType.text
    );
    return Container(
      margin: EdgeInsets.only(left:73,top:200,right:41),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            child : ImageDisplay(imageName: 'aislogo.png'),
          ),
          Container(margin:EdgeInsets.only(top:68),
          ),
          Container(
            //color: Color(0xF9F9F9),
            margin:EdgeInsets.only(right:32),
            decoration: new BoxDecoration(
             
              color:Color.fromARGB(255, 240, 240, 240),
              border:new Border.all(width:0.05,color:Colors.grey),
              borderRadius:
                const BorderRadius.all(const Radius.circular(34))
            ),
            child:_txtusername,
          ),
          Container(margin:EdgeInsets.only(top:22),
          ),
          Container(
            margin:EdgeInsets.only(right: 32),
            child: MaterialButton(
                  height: 50,
                  minWidth: 270,
                  color: Color.fromARGB(255, 47, 220, 150),
                  textColor: Colors.white,
                  child: Text('Request OTP'),
                  onPressed: () => {},
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(34.0),
                      side: BorderSide(color: Colors.transparent))),
          ),
        ]
      ),
    );
        
      
    
  }
}
