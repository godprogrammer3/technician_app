import 'dart:async';
import 'dart:typed_data';

import 'package:equatable/equatable.dart';
import 'package:usb_serial/transaction.dart';
import 'package:usb_serial/usb_serial.dart';

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
      await _port.setPortParameters(
          9600, UsbPort.DATABITS_8, UsbPort.STOPBITS_1, UsbPort.PARITY_NONE);

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
