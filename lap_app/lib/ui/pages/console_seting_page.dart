import 'package:flutter/material.dart';

class ConsoleSettingPage extends StatelessWidget {
  const ConsoleSettingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConsoleSettingPageChild();
  }
}

class ConsoleSettingPageChild extends StatefulWidget {
  ConsoleSettingPageChild({Key key}) : super(key: key);

  @override
  _ConsoleSettingPageChildState createState() =>
      _ConsoleSettingPageChildState();
}

class _ConsoleSettingPageChildState extends State<ConsoleSettingPageChild> {
  String baudrateValue = "9600";
  int dataBitValue = 8;
  String parityValue = "None";
  double stopBitValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Setting console', style: TextStyle(fontSize: 20)),
      ),
      body: Center(
        child: buildBody(context),
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Flexible(
            flex:1, 
            child: Container(),
          ),
          Flexible(
            flex: 2,
            child:Text('Baudrate :',style: TextStyle(color:Colors.white)),
          ),
          Flexible(
            flex:3,
            child: DropdownButton<String>(
              value: baudrateValue,
              icon: Icon(Icons.arrow_drop_down,color: Colors.white),
              iconSize: 24,
              //elevation: 16,
              style: TextStyle(color: Colors.green),
              underline: Container(
                height: 2,
                color: Colors.green,
              ),
              onChanged: (String newValue) {
                setState(() {
                  baudrateValue = newValue;
                });
              },
              items: <String>['2400','9600', '19200', '38400', '57600','115200','custom:1200']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text('      '+value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
       Row(
        children: <Widget>[
          Flexible(
            flex:1, 
            child: Container(),
          ),
          Flexible(
            flex: 2,
            child:Text('Databit :',style: TextStyle(color:Colors.white)),
          ),
          Flexible(
            flex:3,
            child: DropdownButton<int>(
              value: dataBitValue,
              icon: Icon(Icons.arrow_drop_down,color: Colors.white),
              iconSize: 24,
              //elevation: 16,
              style: TextStyle(color: Colors.green),
              underline: Container(
                height: 2,
                color: Colors.green,
              ),
              onChanged: (int newValue) {
                setState(() {
                  dataBitValue = newValue;
                });
              },
              items: <int>[5,6,7,8]
                  .map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('      '+value.toString()),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Flexible(
            flex:1, 
            child: Container(),
          ),
          Flexible(
            flex: 2,
            child:Text('parity :',style: TextStyle(color:Colors.white)),
          ),
          Flexible(
            flex:3,
            child: DropdownButton<String>(
              value: parityValue,
              icon: Icon(Icons.arrow_drop_down,color: Colors.white),
              iconSize: 24,
              //elevation: 16,
              style: TextStyle(color: Colors.green),
              underline: Container(
                height: 2,
                color: Colors.green,
              ),
              onChanged: (String newValue) {
                setState(() {
                  parityValue = newValue;
                });
              },
              items: <String>['None','Odd','Even']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text('      '+value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
       Row(
        children: <Widget>[
          Flexible(
            flex:1, 
            child: Container(),
          ),
          Flexible(
            flex: 2,
            child:Text('Stopbit :',style: TextStyle(color:Colors.white)),
          ),
          Flexible(
            flex:3,
            child: DropdownButton<double>(
              value: stopBitValue,
              icon: Icon(Icons.arrow_drop_down,color: Colors.white),
              iconSize: 24,
              //elevation: 16,
              style: TextStyle(color: Colors.green),
              underline: Container(
                height: 2,
                color: Colors.green,
              ),
              onChanged: (double newValue) {
                setState(() {
                  stopBitValue = newValue;
                });
              },
              items: <double>[1,1.5,2]
                  .map<DropdownMenuItem<double>>((double value) {
                return DropdownMenuItem<double>(
                  value: value,
                  child: Text('      '+value.toString()),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    ]);
  }
}
