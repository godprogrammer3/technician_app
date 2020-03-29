import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class ConsoleSetting extends Equatable{
  final int baudrateValue;
  final int dataBitValue;
  final int parityValue;
  final int stopBitValue;

  ConsoleSetting({
    @required this.baudrateValue, 
    @required this.dataBitValue, 
    @required this.parityValue, 
    @required this.stopBitValue
  });

  @override
  List<Object> get props => [
    baudrateValue, 
    dataBitValue, 
    parityValue, 
    stopBitValue
  ];
  
}