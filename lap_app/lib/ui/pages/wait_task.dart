import 'package:flutter/material.dart';
import 'package:lap_app/ui/widget/widgets.dart';


class WaitTask extends StatelessWidget{


  List<Color> iconColor = <Color>[
    Color.fromARGB(255, 47, 220, 150),
    Colors.grey[400],
    Colors.grey[400],
    Colors.grey[400],
  ];

  
  @override
  Widget build(BuildContext context){
  
    return Scaffold(
      appBar: AppBar(
        title: Text("งานเสร็จพร้อมตรวจสอบ"),

        ),
      body: Container(
        child: buildBody(context),
      ), 
      
      
      bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  size: 30,
                  color: iconColor[1],
                ),
                onPressed: () {
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.view_list,
                  size: 30,
                  color: iconColor[1],
                ),
                onPressed: () {
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.event_note,
                  size: 30,
                  color: iconColor[0],
                ),
                onPressed: () {
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications_active,
                  size: 30,
                  color: iconColor[3],
                ),
                onPressed: () {
                },
              ),
            ],
          ),
        ),








    );
  }
  Widget buildBody(BuildContext context){
      return  Container(
        child: ListView.separated(
          itemCount: 6,
          itemBuilder: (BuildContext context,int index){
            return 
               buildTask(context);
            
          },
          separatorBuilder: (BuildContext context,int index)=>const Divider(),
        )
      );
      
      
      // Stack(
      //   children:<Widget>[
      //     Align(
      //       alignment:Alignment(MediaQuery.of(context).size.width * 0.0008, 0),
      //       child: Column(
      //         mainAxisAlignment: MainAxisAlignment.start,
      //         children:<Widget>[ 
      //           Container(
      //             decoration: new BoxDecoration(
      //               color: new Color.fromARGB(255, 240, 240, 240),
      //               borderRadius: BorderRadius.all(Radius.circular(8.0)),),
      //             width: 365,
      //             height: 177,
                  
      //           ),]

      //       ), ),

      //       Positioned(
      //         left:MediaQuery.of(context).size.width * 0.14,
      //         top: MediaQuery.of(context).size.width * 0.03,
      //         child:new Text('บมจ.ปตท.น้ำมันและการค้าปลีก\n', style: TextStyle(fontFamily: 'supermarket',fontSize:20,color: Colors.black87),),
      //           ),
      //       Positioned(
      //         left:MediaQuery.of(context).size.width * 0.14,
      //         top: MediaQuery.of(context).size.width * 0.13,
      //         child:new Text('โครงการ : บริษัท ปตท.จำกัด', style: TextStyle(fontFamily: 'supermarket',fontSize:18,color: Colors.black87),)
      //           ),
      //       Positioned(
      //         left:MediaQuery.of(context).size.width * 0.14,
      //         top: MediaQuery.of(context).size.width * 0.19,
      //         child:new Text('Project : PTT PUBLIC COMPANY LIMITED', style: TextStyle(fontFamily: 'supermarket',fontSize: 18,color: Colors.black87),)
      //           ),
      //       Positioned(
      //         left:MediaQuery.of(context).size.width * 0.14,
      //         top: MediaQuery.of(context).size.width * 0.25,
      //         child:new Text('Site Code : PTT PUBLIC COMPANY LIMITED_POCRT', style: TextStyle(fontFamily: 'supermarket',fontSize: 18,color: Colors.black87),)
      //           ),
      //       Positioned(
      //         left:MediaQuery.of(context).size.width * 0.075,
      //         right:MediaQuery.of(context).size.width * 0.038,
      //         top: MediaQuery.of(context).size.width * 0.32,
      //         child:Container(
      //           height: 0.2,
      //           width: double.maxFinite,
      //           color: Colors.grey,)
      //           ),
      //       Positioned(
      //         left:MediaQuery.of(context).size.width * 0.076,
      //         top: MediaQuery.of(context).size.width * 0.322,
            
      //         child:ButtonTheme(
      //           minWidth: 365.0,
      //           height: 46.0,
      //           child: FlatButton(
      //             materialTapTargetSize:MaterialTapTargetSize.shrinkWrap,
      //             onPressed: (){

      //           }, child: Text('รายละเอียดงาน', 
      //                   style: TextStyle(fontFamily: 'supermarket',
      //                   fontSize: 18,
      //                   color: Colors.green),),
      //             shape: RoundedRectangleBorder(
      //             borderRadius: const BorderRadius.only(bottomLeft: (const Radius.circular(8)),bottomRight: (const Radius.circular(8))),
      //             side: BorderSide(color: Colors.transparent)) )
      //         )

      //       ),
            

      //       Positioned(
      //         left:MediaQuery.of(context).size.width * -0.01,
      //         top: MediaQuery.of(context).size.width * -0.003,
      //         child: Container(
      //           child:ImageDisplay(
      //             imageName: 'notcomplete_task.svg',
      //             width: MediaQuery.of(context).size.width * 0.17,
      //             height: MediaQuery.of(context).size.height * 0.17
      //           ),  )),

      //   ],
      //   overflow: Overflow.visible,
      // );
    
  }
}
