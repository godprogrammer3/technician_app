import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';
import 'dart:async';

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
  String _deviceText = ': Not found device';
  Function _connectFunction;
  Color _connectColor = Colors.green;
  String _connectText = 'connect';
  bool _isConnected = false;
  UsbPort _port;
  StreamSubscription<String> _subscription;
  Transaction<String> _transaction;
  UsbDevice _device;
  void _updatePorts() async {
    List<UsbDevice> devices = await UsbSerial.listDevices();
    if (devices.length != 0) {
      _device = devices[0];
      _connectFunction = () async {
        if (this.mounted) {
          setState(() {
            if (!_isConnected) {
              _connectColor = Colors.red;
              _connectText = 'disconnect';
            } else {
              _connectColor = Colors.green;
              _connectText = 'connect';
            }
          });
        }
        if(!_isConnected){
           await _connectTo(_device);
        }else{
          await _connectTo(null);
        }
      };
      if (this.mounted) {
        setState(() {
          _deviceText = ': ' + devices[0].productName;
          _connectText = 'connect';
          _connectColor = Colors.green;
        });
      }
    } else {
      _device = null;
      _connectFunction = null;
      if (this.mounted) {
        setState(() {
          _deviceText = ': Not found device';
          _connectText = 'connect';
          _connectColor = Colors.green;
        });
      }
      if(_isConnected){
        await _connectTo(null);
      }
      
    }
  }

  @override
  void initState() {
    super.initState();
    UsbSerial.usbEventStream.listen((UsbEvent event) {
      setState(() {
        _updatePorts();
      });
    });
    _updatePorts();
  }

  @override
  void dispose() {
    if(_port != null) {
      _port.close();
    }
    if( _subscription != null ) {
      _subscription.cancel();
    }
    if( _transaction != null ){
      _transaction.dispose();
    }
    txtController.dispose();
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
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
          width: MediaQuery.of(context).size.width,
          child: Row(
            children: <Widget>[
              Expanded(
                child: TextFormField(
                  style: TextStyle(color: Colors.green),
                  decoration: InputDecoration(
                    hintText: 'Type command here',
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
                  color: (_isConnected) ? Colors.green : Colors.grey,
                  size: 30,
                ),
                onPressed: (_isConnected)
                    ? () async {
                        String data = txtController.text + "\r\n";
                        await _port.write(Uint8List.fromList(data.codeUnits));
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
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).viewInsets.bottom / 24,
      ),
    ]);
  }

  // connect founction -----------
  Future<bool> _connectTo(device) async {
    if (_subscription != null) {
      _subscription.cancel();
      _subscription = null;
    }

    if (_transaction != null) {
      _transaction.dispose();
      _transaction = null;
    }

    if (_port != null) {
      _port.close();
      _port = null;
    }

    if (device == null) {
      _isConnected = false;
      setState(() {
        _widgetList.add(
            Text("> ***Disconnected***", style: TextStyle(color: Colors.yellow)));
      });
      return true;
    }

    _port = await device.create();
    if (!await _port.open()) {
      setState(() {
        _widgetList.add(
            Text("> ***Failed to open port***", style: TextStyle(color: Colors.red)));
      });
      return false;
    }
    await _port.setDTR(true);
    await _port.setRTS(true);
    await _port.setPortParameters(
        9600, UsbPort.DATABITS_8, UsbPort.STOPBITS_1, UsbPort.PARITY_NONE);

    _transaction = Transaction.stringTerminated(
        _port.inputStream, Uint8List.fromList([13, 10]));

    _subscription = _transaction.stream.listen((String line) {
      setState(() {
        _widgetList
            .add(Text('> ' + line, style: TextStyle(color: Colors.white)));
      });
    });

    setState(() {
      _widgetList
          .add(Text("> ***Connected***", style: TextStyle(color: Colors.green[200])));
    });
    _isConnected = true;
    return true;
  }
}
