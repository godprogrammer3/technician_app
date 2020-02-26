import 'package:flutter/material.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:lap_app/ui/widget/widgets.dart';
import 'package:meta/meta.dart';
// import 'package:flutter_plugin_pdf_viewer/flutter_plugin_pdf_viewer.dart';
import 'package:lap_app/ui/pages/pages.dart';

class DevicePage extends StatelessWidget {
  final TokenCredential tokenCredential;

  const DevicePage({Key key, 
    @required this.tokenCredential,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
            appBar: AppBar(
              leading: new IconButton(
                icon: new Icon(
                  Icons.keyboard_backspace,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                'SWITCH_1_238734',
                style: TextStyle(color: Colors.black),
              ),
              centerTitle: true,
              backgroundColor: Colors.white,
              
            ),
            body: SafeArea(
              child: buildBody(context),
                
              
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
                          'เมนูการทำงาน',
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
                        onPressed: () async {
                          // confirmDialog(context);
                          print('pdfff');
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>  Calendar2020PDFScreen() )
                          );
                           
                        },
                        child: Text(
                          'Console >',
                          style: TextStyle(fontFamily: 'supermarket', fontSize: 20, color: Colors.white), ),
                      ),
                    ),
                  ],
              )
              )
               

              ));
  }
  Widget buildBody(BuildContext context) {
     String nameDevice = 'SWITCH1';
     String modelDevice = '123';
     String typeDevice = 'Switch';
    return Column(
      children: <Widget>[
        Row(   
            children: <Widget>[

              Container(
                margin: EdgeInsets.all(16),
                height: 78.0,
                width: 78.0,
                child:ImageDisplay(imageName: 'aislogo.png'),
              ),
              Container(margin:EdgeInsets.only(left:MediaQuery.of(context).size.width*0.04),),

              Expanded(
                
                child: Column(
                  children: <Widget>[
                    Align(alignment: Alignment.centerLeft,child:  Text('${nameDevice}',style: TextStyle(fontFamily: 'supermarket',fontSize: 18),)),
                    Container(margin: EdgeInsets.only(top: 6),),
                    Align(alignment: Alignment.centerLeft,child:  Text('รุ่นอุปกรณ์ : ${modelDevice} ',style: TextStyle(fontFamily: 'supermarket',fontSize: 18)),),
                    Container(margin: EdgeInsets.only(top: 6),),
                    Align(alignment: Alignment.centerLeft,child:  Text('TYPE : ${typeDevice}',style: TextStyle(fontFamily: 'supermarket',fontSize: 18)),),
                  ],
                ), ),
            ],
          ),
          Divider(
            height:10
          )
      ]
       
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
                          confirmDialog(context);
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
                          confirmDialog(context);
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
 
}


  