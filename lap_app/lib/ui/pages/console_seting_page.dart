import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:lap_app/ui/widget/widgets.dart';

class ConsoleSettingPage extends StatelessWidget {
  const ConsoleSettingPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider(
        create: (context) => ConsoleSettingBloc(),
        child: ConsoleSettingPageChild(),
      ),
    );
  }
}

class ConsoleSettingPageChild extends StatefulWidget {
  ConsoleSettingPageChild({Key key}) : super(key: key);

  @override
  _ConsoleSettingPageChildState createState() =>
      _ConsoleSettingPageChildState();
}

class _ConsoleSettingPageChildState extends State<ConsoleSettingPageChild> {
  int _baudrateValue;
  int _dataBitValue;
  int _parityValue;
  int _stopBitValue;
  int _customBaudrateValue;
  bool _isFirstLoad = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Setting console', style: TextStyle(fontSize: 20)),
      ),
      body: Center(
        child: BlocBuilder(
            bloc: BlocProvider.of<ConsoleSettingBloc>(context),
            builder: (BuildContext context, state) {
              if (state is ConsoleSettingInitial) {
                final consoleSettingBloc =
                    BlocProvider.of<ConsoleSettingBloc>(context);
                consoleSettingBloc.add(ConsoleSettingInitEvent());
                return LoadingWidget(width: 50, height: 50);
              } else if (state is ConsoleSettingReadyState) {
                if (_isFirstLoad) {
                  _baudrateValue = state.consoleSetting.baudrateValue;
                  _dataBitValue = state.consoleSetting.dataBitValue;
                  _parityValue = state.consoleSetting.parityValue;
                  _stopBitValue = state.consoleSetting.stopBitValue;
                  _customBaudrateValue = state.customBaudrateValue;
                  _isFirstLoad = false;
                }

                return buildBody(context);
              }
            }),
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(children: <Widget>[
      Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Flexible(
            flex: 2,
            child: Text('Baudrate :', style: TextStyle(color: Colors.white)),
          ),
          Flexible(
            flex: 3,
            child: DropdownButton<int>(
              value: _baudrateValue,
              icon: Icon(Icons.arrow_drop_down, color: Colors.white),
              iconSize: 24,
              //elevation: 16,
              style: TextStyle(color: Colors.green),
              underline: Container(
                height: 2,
                color: Colors.green,
              ),
              onChanged: (int newValue) {
                setState(() {
                  _baudrateValue = newValue;
                });
              },
              items: <int>[
                2400,
                9600,
                19200,
                38400,
                57600,
                115200,
                _customBaudrateValue * -1
              ].map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('      ' + value.toString()),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Flexible(
            flex: 2,
            child: Text('Databit :', style: TextStyle(color: Colors.white)),
          ),
          Flexible(
            flex: 3,
            child: DropdownButton<int>(
              value: _dataBitValue,
              icon: Icon(Icons.arrow_drop_down, color: Colors.white),
              iconSize: 24,
              //elevation: 16,
              style: TextStyle(color: Colors.green),
              underline: Container(
                height: 2,
                color: Colors.green,
              ),
              onChanged: (int newValue) {
                setState(() {
                  _dataBitValue = newValue;
                });
              },
              items: <int>[5, 6, 7, 8].map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('      ' + value.toString()),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Flexible(
            flex: 2,
            child: Text('parity :', style: TextStyle(color: Colors.white)),
          ),
          Flexible(
            flex: 3,
            child: DropdownButton<int>(
              value: _parityValue,
              icon: Icon(Icons.arrow_drop_down, color: Colors.white),
              iconSize: 24,
              //elevation: 16,
              style: TextStyle(color: Colors.green),
              underline: Container(
                height: 2,
                color: Colors.green,
              ),
              onChanged: (int newValue) {
                setState(() {
                  _parityValue = newValue;
                });
              },
              items: <int>[0, 1, 2].map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: parityValueToWidget(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      Row(
        children: <Widget>[
          Flexible(
            flex: 1,
            child: Container(),
          ),
          Flexible(
            flex: 2,
            child: Text('Stopbit :', style: TextStyle(color: Colors.white)),
          ),
          Flexible(
            flex: 3,
            child: DropdownButton<int>(
              value: _stopBitValue,
              icon: Icon(Icons.arrow_drop_down, color: Colors.white),
              iconSize: 24,
              //elevation: 16,
              style: TextStyle(color: Colors.green),
              underline: Container(
                height: 2,
                color: Colors.green,
              ),
              onChanged: (int newValue) {
                setState(() {
                  _stopBitValue = newValue;
                });
              },
              items: <int>[
                1,
                3,
                2,
              ].map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: stopBitToWidget(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
      SizedBox(height:20),
      ButtonTheme(
        minWidth: MediaQuery.of(context).size.width * 0.38,
        height: 40,
        child: FlatButton(
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(8.0),
              side: BorderSide(color: Colors.white)),
          color: Colors.white,
          textColor: Colors.green,
          padding: EdgeInsets.all(17.0),
          onPressed: () {
            print('Save setting');
          },
          child: Text(
            'Save setting',
            style: TextStyle(
                fontFamily: 'supermarket', fontSize: 20, color: Colors.green),
          ),
        ),
      ),
    ]);
  }

  Widget parityValueToWidget(int value) {
    switch (value) {
      case 0:
        {
          return Text('     None');
          break;
        }
      case 1:
        {
          return Text('     Odd');
          break;
        }
      case 2:
        {
          return Text('     Even');
          break;
        }
    }
  }

  Widget stopBitToWidget(int value) {
    switch (value) {
      case 1:
        {
          return Text('   1');
          break;
        }
      case 3:
        {
          return Text('   1.5');
          break;
        }
      case 2:
        {
          return Text('    2');
          break;
        }
    }
  }
}
