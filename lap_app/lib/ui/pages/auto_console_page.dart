import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:lap_app/models/models.dart';
import 'package:lap_app/ui/widget/widgets.dart';
import 'package:usb_serial/usb_serial.dart';

class AutoConsolePage extends StatelessWidget {
  final List<Command> commands;
  AutoConsolePage({Key key, this.commands}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AutoConsoleBloc(),
      child: AutoPageChild(commands: commands),
    );
  }
}

class AutoPageChild extends StatefulWidget {
  final List<Command> commands;
  AutoPageChild({Key key, this.commands}) : super(key: key);

  @override
  _AutoPageChildState createState() => _AutoPageChildState(commands: commands);
}

class _AutoPageChildState extends State<AutoPageChild> {
  List<Command> commands;
  List<Widget> _widgetList = [];
  TextEditingController txtController = new TextEditingController();
  String _deviceText = ': Not found device';
  String _connectText = 'connect';
  Function _connectFunction;
  Color _connectColor = Colors.green;
  bool _isEnabledTyping = false;
  bool _isFirstRun = true;
  ConsoleModel _consoleModel = new ConsoleModel();
  _AutoPageChildState({this.commands});
  Future<void> _updatePorts() async {
    List<UsbDevice> devices = await UsbSerial.listDevices();
    if (devices.length != 0) {
      _connectFunction = () async {
        if (this.mounted) {
          setState(() {
            if (!_consoleModel.isConnected) {
              _connectColor = Colors.red;
              _connectText = 'disconnect';
              _isEnabledTyping = true;
              _widgetList.add(Text('> ***Connected***',
                  style: TextStyle(color: Colors.green[200])));
            } else {
              _connectColor = Colors.green;
              _connectText = 'connect';
              _isEnabledTyping = false;
              _widgetList.add(Text('> ***Disconnected***',
                  style: TextStyle(color: Colors.red)));
            }
          });
        }
        if (_isEnabledTyping) {
          await _consoleModel.connect(onReceivedMessage);
        } else {
          _consoleModel.disconnect();
        }
      };
      if (this.mounted) {
        setState(() {
          _deviceText = ': ' + devices[0].productName;
          _connectText = 'connect';
          _connectColor = Colors.green;
        });
      }
       if (_isFirstRun) {
        _isFirstRun = false;
        await _consoleModel.connect(onReceivedMessage);
        await _runConfig();
        
        _connectColor = Colors.red;
        _connectText = 'disconnect';
        _isEnabledTyping = true;
        _widgetList.add(Text('> ***Connected***',
            style: TextStyle(color: Colors.green[200])));
      }
    } else {
      _connectFunction = null;
      if (this.mounted) {
        setState(() {
          _deviceText = ': Not found device';
          _connectText = 'connect';
          _connectColor = Colors.green;
          _isEnabledTyping = false;
        });
      }
      if (_consoleModel.isConnected) {
        _consoleModel.disconnect();
        _widgetList.add(
            Text('> ***Disconnected***', style: TextStyle(color: Colors.red)));
      }
    }
  }

  void onReceivedMessage(String message) async {
    setState(() {
      _widgetList.add(Text(
        '> ' + message,
        style: TextStyle(color: Colors.white),
      ));
    });
    if (message == commands[0].receiveCompleted) {
      commands.removeAt(0);
      await _runConfig();
    }
  }

  Future<void> _runConfig() async {
    if (commands.isNotEmpty) {
      await _consoleModel.write(commands[0].sendCommand + '\r\n');
      setState(() {
        _widgetList.add(Text('< ' + commands[0].sendCommand + '\r\n',
            style: TextStyle(color: Colors.green)));
      });
    } else {
      setState(() {
        _widgetList.add(Text('< ***Completed config***',
            style: TextStyle(color: Colors.green[200])));
      });
      commands = null;
      final autoConsoleBloc = BlocProvider.of<AutoConsoleBloc>(context);
      autoConsoleBloc.add(AutoConsoleInitialEvent());
    }
  }

  @override
  void initState() { 
    super.initState();
    UsbSerial.usbEventStream.listen((UsbEvent event) {
        _updatePorts();
    });
    _updatePorts();
   
  }

  @override
  void dispose() {
    txtController.dispose();
    _consoleModel.disconnect();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(_deviceText, style: TextStyle(fontSize: 15)),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: RaisedButton(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(_connectText,
                    style: TextStyle(
                      color: Colors.white,
                    )),
                onPressed: _connectFunction,
                disabledColor: Colors.grey,
                color: _connectColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                )),
          ),
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                print('setting button');
              }),
        ],
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
        child: BlocBuilder(
            bloc: BlocProvider.of<AutoConsoleBloc>(context),
            builder: (BuildContext context, state) {
              if (state is AutoConsoleInitial) {
                if (commands != null) {
                  if (_isFirstRun) {
                    final autoConsoleBloc =
                        BlocProvider.of<AutoConsoleBloc>(context);
                    autoConsoleBloc.add(AutoConsoleStartEvent(
                        callBackFunction: onReceivedMessage));
                    return LoadingWidget(width: 50, height: 50);
                  } else {
                    return Text('Running config...',
                        style: TextStyle(color: Colors.white));
                  }
                } else {
                  return buildCommandInput();
                }
              } else if (state is AutoConsoleErrorState) {
                switch (state.message) {
                  case "Device not found":
                    {
                      return Text('Please connect device',
                          style: TextStyle(color: Colors.white));
                    }
                }
              } else if (state is AutoConsoleStartState) {
                // if (_isFirstRun) {
                //   _consoleModel = state.consoleModel;
                //   _runConfig();
                //   _isFirstRun = false;
                //   _connectColor = Colors.red;
                //   _connectText = 'disconnect';
                //   _isEnabledTyping = true;
                //   _widgetList.add(Text('> ***Connected***',
                //       style: TextStyle(color: Colors.green[200])));
                // }
                _updatePorts();
                return Text('Running config...',
                    style: TextStyle(color: Colors.white));
              } else {
                return LoadingWidget(width: 50, height: 50);
              }
            }),
      ),
      SizedBox(
        height: MediaQuery.of(context).viewInsets.bottom / 24,
      ),
    ]);
  }

  Widget buildCommandInput() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              style: TextStyle(color: Colors.green),
              decoration: InputDecoration(
                hintText: (_isEnabledTyping)
                    ? 'Type command here'
                    : 'please connect device',
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 3),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.green, width: 3),
                ),
                contentPadding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
              ),
              controller: txtController,
              enabled: _isEnabledTyping,
            ),
          ),
          IconButton(
              icon: Icon(Icons.clear, color: Colors.white),
              onPressed: () {
                txtController.clear();
              }),
          IconButton(
            icon: Icon(
              Icons.send,
              color: (_isEnabledTyping) ? Colors.green : Colors.grey,
              size: 30,
            ),
            onPressed: (_consoleModel.isConnected)
                ? () async {
                    String data = txtController.text + "\r\n";
                    await _consoleModel.write(data);
                    setState(() {
                      _widgetList.add(
                        Text('< ' + txtController.text,
                            style: TextStyle(color: Colors.green)),
                      );
                    });
                  }
                : null,
          ),
        ],
      ),
    );
  }
}
