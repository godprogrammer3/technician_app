import 'package:flutter/material.dart';

class ConsolePage extends StatelessWidget {
  const ConsolePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConsolePageChild();
  }
}

class ConsolePageChild extends StatefulWidget {
  const ConsolePageChild({Key key}) : super(key: key);

  @override
  _ConsolePageChildState createState() => _ConsolePageChildState();
}

class _ConsolePageChildState extends State<ConsolePageChild> {
  List<Widget> _widgetList = [];
  TextEditingController txtController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: buildBody(context),
      backgroundColor: Colors.black,
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(children: <Widget>[
      Flexible(
        flex: 9,
        child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.topLeft,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: _widgetList,
                    ),
                  ),
                ],
              ),
              reverse: true,
            )),
      ),
      Flexible(
        flex: 1,
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  style: TextStyle(color: Colors.green),
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 3),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 3),
                    ),
                    contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
                  ),
                  controller: txtController,
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.send,
                  color: Colors.green,
                  size: 30,
                ),
                onPressed: () {
                  setState(() {
                    _widgetList.add(
                      Text('<    '+txtController.text,
                          style: TextStyle(color: Colors.green)),
                    );
                  });
                },
              ),
            ],
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).viewInsets.bottom / 24,
      ),
    ]);
  }
}
