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
        title: ListTile(
          title: Text('งานเสร็จพร้อมตรวจสอบ', style: TextStyle(fontFamily: 'supermarket',fontSize:23,color: Colors.black87),),
          subtitle:Text('14 มกราคม 2562', style: TextStyle(fontFamily: 'supermarket',fontSize:17,color: Colors.grey),),
        ),
        backgroundColor: Color(0xfafafa),
        elevation:0

        ),
      body:buildBody(context),
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
    return CustomScrollView(
        slivers: <Widget>[
          // SliverAppBar(
          //   title:ListTile(
          //     title: Text('งานเสร็จพร้อมตรวจสอบ', style: TextStyle(fontFamily: 'supermarket',fontSize:23,color: Colors.black87),),
          //     subtitle: Text('14 มกราคม 2562', style: TextStyle(fontFamily: 'supermarket',fontSize:17,color: Colors.grey),),
          //   ),
          //   pinned: true,
          //   elevation: 0,
          //   backgroundColor: Color(0xfafafa),
          //   //floating:true,
          //   brightness:Brightness.dark,
          //   //expandedHeight: 200,
          // ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context,int index){
                if (index.isEven) {
                  return Padding(
                  child: waittTask(context),
                  padding: EdgeInsets.all(7));
            }
              return Divider(height: 0, color: Colors.white);
          },
              childCount: 10,
              
            ),
          )
        ],

);
  }
}
