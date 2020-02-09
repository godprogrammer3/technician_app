import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/login_bloc.dart';
import 'package:lap_app/ui/widget/widgets.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:configurable_expansion_tile/configurable_expansion_tile.dart';

class Yourtask extends StatelessWidget{
  @override
  Widget build(BuildContext contex){
  
    return Scaffold(
      body: SingleChildScrollView(
        child: buildBody(contex),
      )
    );
  }
  Widget buildBody(BuildContext contex){
    return Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      width: 334,
      margin: EdgeInsets.all(4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              left: 80.0 ),
            decoration: new BoxDecoration(
              color: new Color(0xFFF9A9A9),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0)

              ),
            ),
            width: 334,
            height: 26,
            child: new Row(
              children: <Widget>[
                new Text('test',
                        style: TextStyle(fontSize: 14,color: Colors.black87),
                        ),
            
            
              ],
            ),
           
          ),

  
          ConfigurableExpansionTile(   
                header: Container(
                  
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[                  
                      Container(
                        child: Icon(Icons.mood,size:60,color:Colors.redAccent),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.only(
                              left: 10,
                              top: 10
                            ),
                            width:250 ,
                            child: 
                            new Text('test',
                            style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16,color: Color(0xFFF34949)),
                            ),
                            
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 3
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Text('  '),
                                Icon(Icons.access_time,size: 20,color: Colors.red[300],),
                                Text(' '),
                                Text('test',style: TextStyle( fontSize: 15,color: Colors.black87)),
                                //
                              ],
                            )
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              top: 3
                            ),
                            child: Row(
                            
                              children: <Widget>[
                                Text('  '),
                                Icon(Icons.location_on,size: 20,color: Colors.red[300]),
                                Text(' '),
                                Text('test',style: TextStyle( fontSize: 15,color: Colors.black87),),
                                                                   
                              ],
                            )
                          ),
                  

                          Container(
                            margin: EdgeInsets.only(
                              left: 85
                            ),
                           
                            child: Icon(Icons.expand_more,size:20,color:Colors.red[300]),),
                        ],
                      ),

                    ],
                  )
                  
                ),
                
                  
                children: [
                  Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.all(10),
                      ),
                      Flexible(
                            child : Text('test',style: TextStyle(
                            color: Colors.red[400],
                            fontSize: 15),overflow:TextOverflow.clip,)
                        ),
                       
                      Container(
                        margin: EdgeInsets.all(10),
                      ),
                      
                      ],
                  ),
                  Container(height: 10,)
                ],
              ),
              
        ],
        
      ),
  
     
    );
        
      
    
  }
}
