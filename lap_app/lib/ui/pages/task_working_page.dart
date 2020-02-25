import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:lap_app/ui/widget/widgets.dart';
import 'package:meta/meta.dart';

class TaskWorkingPage extends StatelessWidget {
  final TokenCredential tokenCredential;

  const TaskWorkingPage({Key key, 
    @required this.tokenCredential,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              leading: new IconButton(
                icon: new Icon(
                  Icons.keyboard_backspace,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                'Network Configuration',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              bottom: TabBar(
                  indicatorColor: const Color(0xff36B772),
                  labelColor: Color(0xff69736D),
                  tabs: [
                    new Tab(
                      text: 'DETAIL',
                    ),
                    new Tab(text: 'EQUIPMENT')
                  ]),
            ),
            body: TabBarView(
              children: <Widget>[
                // Text('Detail na ja')
                buildBodyDetail(context),
                // Text('Device na ja')
                buildBodyDevice(context)
              ],
            ),
            bottomNavigationBar: BottomAppBar(
              color: Colors.white,
              child: Container(
                margin: EdgeInsets.all(10),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    ButtonTheme(
                      
                      minWidth: MediaQuery.of(context).size.width*0.52,
                      height:50,
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                            side: BorderSide(color: Colors.green)),
                        color: Color(0xFAFAFA),
                        textColor: Colors.green,
                        padding: EdgeInsets.all(17.0),
                        onPressed: () {
                          confirmDialog(context);
                        },
                        child: Text(
                          'จบการทำงาน',
                          style: TextStyle(fontFamily: 'supermarket', fontSize: 20, color: const Color(0xFF46B085)), ),
                      ),
                    ),
                    
                   
                    ButtonTheme(
                      
                      minWidth: MediaQuery.of(context).size.width*0.38,
                      height:50,
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                            side: BorderSide(color: Color.fromARGB(255, 47, 220, 150))),
                        color: Color.fromARGB(255, 47, 220, 150),
                        textColor: Colors.green,
                        padding: EdgeInsets.all(17.0),
                        onPressed: () {
                          confirmDialog(context);
                        },
                        child: Text(
                          'Console >',
                          style: TextStyle(fontFamily: 'supermarket', fontSize: 20, color: Colors.white), ),
                      ),
                    ),
                  ],
              )
              )
               

              )
        )
      );
  }

  void confirmDialog(BuildContext context){
    var cfDialog = AlertDialog(
      title: Text("ยืนยันการรับทำงาน",style: TextStyle(fontFamily: 'supermarket', fontSize: 20, color: Colors.black),textAlign: TextAlign.center,),
      content: Text("ชื่องาน/โปรเจคที่จะรับนะจ้ะ pass ค่ามาให้ด้วย"),
      actions: <Widget>[
        Row(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    
                    ButtonTheme(
                      
                      minWidth: MediaQuery.of(context).size.width*0.35,
                      height:10,
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                            side: BorderSide(color: Colors.red)),
                        color: Color(0xFAFAFA),
                        textColor: Colors.red,
                        padding: EdgeInsets.all(17.0),
                        onPressed: () {
                          // confirmDialog(context);
                          Navigator.pop(context);
                        },
                        child: Text(
                          'ยกเลิก',
                          style: TextStyle(fontFamily: 'supermarket', fontSize: 18, color:Colors.red), ),
                      ),
                    ),
                    Container(margin:EdgeInsets.only(left:14),),
                   
                    ButtonTheme(
                      
                      minWidth: MediaQuery.of(context).size.width*0.35,
                      height:10,
                      child: FlatButton(
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(8.0),
                            side: BorderSide(color: Colors.green)),
                        color: Color(0xFAFAFA),
                        textColor: Colors.green,
                        padding: EdgeInsets.all(17.0),
                        onPressed: () {
                          // confirmDialog(context);
                          Navigator.pop(context);
                          showButtoSheet(context);
                        },
                        child: Text(
                          'ยืนยัน',
                          style: TextStyle(fontFamily: 'supermarket', fontSize: 18, color: const Color(0xFF46B085)), ),
                      ),
                    ),
                    Container(margin:EdgeInsets.only(left:5),),
                  ],
              )
        // OutlineButton(
          
        //   child: Text("ยกเลิก"),
        //   onPressed: (){
        //     Navigator.pop(context);
        //  },),
        // OutlineButton(
        //   child: Text("ยืนยัน"),
        //   onPressed: (){
        //     print('Yeah ok you got this job by API and going to next page');
        //     // Navigator.pop(context);
        //   },)

      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context){
        return cfDialog;
      }
    );
  }

  void showButtoSheet(BuildContext context){
    showModalBottomSheet(context: context, builder: (context){
       return Container( color: const Color(0xFF737373),
        height: 340,
         child: Container(
         child: Column( children: <Widget>[
                  ListTile(title: Text("Reset Factory")),
                  Divider(height: 0,color: const Color(0x15000014),thickness: 1,indent: 16,endIndent: 16,),
                  ListTile(title: Text("Erase")),
                  Divider(height: 0,color: const Color(0x15000014),thickness: 1,indent: 16,endIndent: 16,),
                  ListTile(title: Text("Install config")),
                  Divider(height: 0,color: const Color(0x15000014),thickness: 1,indent: 16,endIndent: 16,),
                  ListTile(title: Text("Update")),
                  Divider(height: 0,color: const Color(0x15000014),thickness: 1,indent: 16,endIndent: 16,),
                  ListTile(title: Text("Post check")),
                  Divider(height: 0,color: const Color(0x15000014),thickness: 1,indent: 16,endIndent: 16,),
                  ListTile(title: Text("Remote control from server")),
                  ],
                ),
        decoration: BoxDecoration(
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(8),
            topRight: const Radius.circular(8),
          )
        ),
       )
       );
       
    });
  }


}
