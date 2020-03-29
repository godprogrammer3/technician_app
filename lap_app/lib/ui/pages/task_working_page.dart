import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:lap_app/ui/pages/pages.dart';
import 'package:lap_app/ui/widget/widgets.dart';
import 'package:meta/meta.dart';

class TaskWorkingPage extends StatelessWidget {
  final TokenCredential tokenCredential;

  const TaskWorkingPage({
    Key key,
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
                buildBodyDetail(context),
                buildBodyDevice(context)
              ],
            ),
            bottomNavigationBar: BottomAppBar(
                color: Colors.white,
                child: Container(
                    margin: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width * 0.52,
                          height: 50,
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0),
                                side: BorderSide(color: Colors.green)),
                            color: Color(0xFAFAFA),
                            textColor: Colors.green,
                            padding: EdgeInsets.all(17.0),
                            onPressed: () {
                              _displayDialog(context);
                            },
                            child: Text(
                              'จบการทำงาน',
                              style: TextStyle(
                                  fontFamily: 'supermarket',
                                  fontSize: 20,
                                  color: const Color(0xFF46B085)),
                            ),
                          ),
                        ),
                        ButtonTheme(
                          minWidth: MediaQuery.of(context).size.width * 0.38,
                          height: 50,
                          child: FlatButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(8.0),
                                side: BorderSide(
                                    color: Color.fromARGB(255, 47, 220, 150))),
                            color: Color.fromARGB(255, 47, 220, 150),
                            textColor: Colors.green,
                            padding: EdgeInsets.all(17.0),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return AutoConsolePage();
                                  }));
                            },
                            child: Text(
                              'Console >',
                              style: TextStyle(
                                  fontFamily: 'supermarket',
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )))));
  }

  void _displayDialog(BuildContext context) async {
    int _currentIndex = 1;
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text(
                "ยืนยันการจบการทำงาน",
                style: TextStyle(
                    fontFamily: 'supermarket',
                    fontSize: 20,
                    color: Colors.black),
                textAlign: TextAlign.center,
              ),
              content:
                  Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                RadioListTile(
                  title: Text(
                    "ทำงานสำเร็จ",
                    style: TextStyle(
                        fontFamily: 'supermarket',
                        fontSize: 20,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  groupValue: _currentIndex,
                  value: 1,
                  onChanged: (val) {
                    _currentIndex = val;
                  },
                ),
                RadioListTile(
                  title: Text(
                    "ยกเลิกการเป็นเจ้าของงาน",
                    style: TextStyle(
                        fontFamily: 'supermarket',
                        fontSize: 20,
                        color: Colors.black),
                    textAlign: TextAlign.left,
                  ),
                  groupValue: _currentIndex,
                  value: 2,
                  onChanged: (val) {
                    _currentIndex = val;
                  },
                ),
              ]),
              actions: <Widget>[
                new Row(
                  children: <Widget>[
                    FlatButton(
                      child: new Text('CANCEL'),
                      textColor: Colors.red,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.13),
                    ),
                    FlatButton(
                      child: new Text('OK'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1),
                    ),
                  ],
                )
              ]);
        });
  }
}
