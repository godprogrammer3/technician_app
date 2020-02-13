import 'package:flutter/material.dart';
import 'package:lap_app/ui/widget/widgets.dart';



  Widget waitTask(BuildContext context){

      return  Stack(
        children:<Widget>[
          Align(
            alignment:Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget>[ 
                Container(
                  decoration: new BoxDecoration(
                    color: new Color.fromARGB(255, 240, 240, 240),
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),),
                  width: 365,
                  height: 177,
                  
                ),]

            ), ),

            Positioned(
              left:MediaQuery.of(context).size.width * 0.1,
              top: MediaQuery.of(context).size.width * 0.05,
              child:new Text('บมจ.ปตท.น้ำมันและการค้าปลีก\n', style: TextStyle(fontFamily: 'supermarket',fontSize:20,color: Colors.black87),),
                ),
            Positioned(
              left:MediaQuery.of(context).size.width * 0.1,
              top: MediaQuery.of(context).size.width * 0.13,
              child:new Text('โครงการ : บริษัท ปตท.จำกัด', style: TextStyle(fontFamily: 'supermarket',fontSize:18,color: Colors.black87),)
                ),
            Positioned(
              left:MediaQuery.of(context).size.width * 0.1,
              top: MediaQuery.of(context).size.width * 0.19,
              child:new Text('Project : PTT PUBLIC COMPANY LIMITED', style: TextStyle(fontFamily: 'supermarket',fontSize: 18,color: Colors.black87),)
                ),
            Positioned(
              left:MediaQuery.of(context).size.width * 0.1,
              top: MediaQuery.of(context).size.width * 0.25,
              child:new Text('Site Code : PTT PUBLIC COMPANY LIMITED_POCRT', style: TextStyle(fontFamily: 'supermarket',fontSize: 18,color: Colors.black87),)
                ),
            Positioned(
              left:MediaQuery.of(context).size.width * 0.057,
              right:MediaQuery.of(context).size.width * 0.057,
              top: MediaQuery.of(context).size.width * 0.32,
              child:Container(
                height: 0.2,
                width: double.maxFinite,
                color: Colors.grey,)
                ),
            Positioned(
              left:MediaQuery.of(context).size.width * 0.057,
              top: MediaQuery.of(context).size.width * 0.322,
            
              child:ButtonTheme(
                minWidth: 365.0,
                height: 46.0,
                child: FlatButton(
                  materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
                  onPressed: (){

                }, child: Text('รายละเอียดงาน', 
                        style: TextStyle(fontFamily: 'supermarket',
                        fontSize: 18,
                        color: Colors.green),),
                  shape: RoundedRectangleBorder(
                  borderRadius: const BorderRadius.only(bottomLeft: (const Radius.circular(8)),bottomRight: (const Radius.circular(8))),
                  side: BorderSide(color: Colors.transparent)) )
              )

            ),
        ],
        overflow: Overflow.visible,
      );
    
  }
