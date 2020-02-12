import 'package:flutter/material.dart';
import 'package:lap_app/ui/widget/widgets.dart';


class Yourtask extends StatelessWidget{
  @override
  Widget build(BuildContext context){
  
    return Scaffold(
      body: SingleChildScrollView(
        child: buildBody(context),
      )
    );
  }
  Widget buildBody(BuildContext context){
      return  Stack(
        children:<Widget>[
          Align(
            alignment:Alignment(MediaQuery.of(context).size.width * 0.0008, 0),
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
              left:MediaQuery.of(context).size.width * 0.14,
              top: MediaQuery.of(context).size.width * 0.03,
              child:new Text('Network Configuration\n', style: TextStyle(fontSize: 18,color: Colors.black87),),
                ),
            Positioned(
              left:MediaQuery.of(context).size.width * 0.14,
              top: MediaQuery.of(context).size.width * 0.13,
              child:new Text('โครงการ : บริษัท ปตท.จำกัด', style: TextStyle(fontFamily: 'supermarket',fontSize:18,color: Colors.black87),)
                ),
            Positioned(
              left:MediaQuery.of(context).size.width * 0.14,
              top: MediaQuery.of(context).size.width * 0.19,
              child:new Text('Project : PTT PUBLIC COMPANY LIMITED', style: TextStyle(fontFamily: 'supermarket',fontSize: 18,color: Colors.black87),)
                ),
            Positioned(
              left:MediaQuery.of(context).size.width * 0.14,
              top: MediaQuery.of(context).size.width * 0.25,
              child:new Text('Site Code : PTT PUBLIC COMPANY LIMITED_POCRT', style: TextStyle(fontFamily: 'supermarket',fontSize: 18,color: Colors.black87),)
                ),
            Positioned(
              left:MediaQuery.of(context).size.width * 0.1,
              top: MediaQuery.of(context).size.width * 0.316,
              
              child:ButtonTheme(
                minWidth: 350.0,
                height: 40.0,
                child: FlatButton(
                  materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
                  onPressed: (){

                }, child: Text('รายละเอียดงาน', 
                        style: TextStyle(fontFamily: 'supermarket',
                        fontSize: 18,
                        color: Colors.green),), )
              )

            ),
            

            Positioned(
              left:MediaQuery.of(context).size.width * -0.01,
              top: MediaQuery.of(context).size.width * -0.003,
              child: Container(
                child:ImageDisplay(
                  imageName: 'notcomplete_task.svg',
                  width: MediaQuery.of(context).size.width * 0.17,
                  height: MediaQuery.of(context).size.height * 0.17
                ),  )),

        ],
        overflow: Overflow.visible,
      );
    
  }
}
