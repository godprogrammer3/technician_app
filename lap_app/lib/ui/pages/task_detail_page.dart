import 'package:flutter/material.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:lap_app/ui/widget/widgets.dart';
import 'package:meta/meta.dart';

class TaskDetailPage extends StatelessWidget {
  final TokenCredential tokenCredential;

  const TaskDetailPage({Key key, 
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
                  margin: EdgeInsets.all(20),
                  width: double.infinity,
                  height: 50,
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
                ))));
  }
}
