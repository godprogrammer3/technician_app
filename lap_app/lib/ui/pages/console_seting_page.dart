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
  String dropdownValue = "One";
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
      DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(Icons.arrow_drop_down),
        iconSize: 24,
        //elevation: 16,
        style: TextStyle(color: Colors.deepPurple),
        underline: Container(
          height: 2,
          color: Colors.deepPurpleAccent,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>['One', 'Two', 'Three', 'Four']
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    ]);
  }
}
