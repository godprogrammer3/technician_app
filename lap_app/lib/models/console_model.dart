import 'dart:async';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ConsoleModel extends Equatable {
  UsbPort _port;
  StreamSubscription<String> _subscription;
  Transaction<String> _transaction;
  UsbDevice _device;
  bool isConnected = false;
  Future<void> connect(Function callBackFunction) async {
    final devices = await UsbSerial.listDevices();
    if (devices.length > 0) {
      _device = devices[0];
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
      _port = await _device.create();
      if (!await _port.open()) {
        throw ConsoleError(message: 'Failed to open port');
      }
      await _port.setDTR(false);
      await _port.setRTS(false);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      var baudrateValue = prefs.getInt('baudrateValue');
      if(baudrateValue == null) {
        baudrateValue = 9600;
        await prefs.setInt('baudrateValue', baudrateValue);
      }
      var dataBitValue = prefs.getInt('dataBitValue');
      if(dataBitValue == null) {
        dataBitValue = 8;
        await prefs.setInt('dataBitValue', dataBitValue);
      }
      var parityValue = prefs.getInt('parityValue');
      if( parityValue == null ) {
        parityValue = 0;
        await prefs.setInt('parityValue', parityValue);
      }
      var stopBitValue = prefs.getInt('stopBitValue');
      if( stopBitValue == null ) {
        stopBitValue = 1;
        await prefs.setInt('stopBitValue', stopBitValue);
      }

      await _port.setPortParameters(
        baudrateValue, dataBitValue,stopBitValue,parityValue);

      _transaction = Transaction.stringTerminated(
          _port.inputStream, Uint8List.fromList([13, 10]));

      _subscription = _transaction.stream.listen(callBackFunction);
      isConnected = true;
    } else {
      throw ConsoleError(message: "Device not found");
    }
  }

  void disconnect() {
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
    isConnected = false;
  }

  Future<void> write(String message) async {
    await _port.write(Uint8List.fromList(message.codeUnits));
  }


  @override
  List<Object> get props => null;
}

class ConsoleError extends Error {
  final String message;
  ConsoleError({this.message});
}
