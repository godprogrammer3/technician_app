import 'package:flutter/material.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:lap_app/ui/widget/widgets.dart';
import 'package:meta/meta.dart';

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
                child: Row(
                  children: <Widget>[
                    Container(
                      // margin: EdgeInsets.all(20),
                      // width: double.infinity,
                      // height: 50,
                      child: RaisedButton(
                        color: const Color(0xFF2FDC96),
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0),
                        ),
                        textColor: Colors.white,
                        onPressed: () => print('hello'),
                        child: Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              right: 10,
                            ),
                            child: Text(
                              'รับทำงาน',
                              style: TextStyle(
                                  fontFamily: 'supermarket', fontSize: 20),
                          )),
                  ),
                )
                  ],


                )
                
                
                
                ));
  }
  Widget buildBody(BuildContext context) {
     List<String> nameDevice = <String>['SWITCH1','SWITCH1','SWITCH1'];
     List<String> modelDevice = <String>['123','456','789'];
     List<String> typeDevice = <String>['Switch','Lab','Multimeter'];
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
                    Align(alignment: Alignment.centerLeft,child:  Text('aaaaaaaaaaaaa',style: TextStyle(fontFamily: 'supermarket',fontSize: 18),)),
                    Container(margin: EdgeInsets.only(top: 6),),
                    Align(alignment: Alignment.centerLeft,child:  Text('รุ่นอุปกรณ์ : sdsdfsdf ',style: TextStyle(fontFamily: 'supermarket',fontSize: 18)),),
                    Container(margin: EdgeInsets.only(top: 6),),
                    Align(alignment: Alignment.centerLeft,child:  Text('TYPE : sdfsdfds',style: TextStyle(fontFamily: 'supermarket',fontSize: 18)),),
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
}
