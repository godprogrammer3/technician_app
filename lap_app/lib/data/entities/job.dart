import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
class Job extends Equatable {
  final List<Equipment> equipments;
  final int jobId;
  final String nonSearch;
  final String projectNameTh;
  final String siteCode;
  final String projectNameEn;
  final List<Service> services;
  final String projectName;
  final String customerName;
  final String ownBy;

  Job({
    @required this.equipments, 
    @required this.jobId, 
    @required this.nonSearch, 
    @required this.projectNameTh, 
    @required this.siteCode, 
    @required this.projectNameEn, 
    @required this.services, 
    @required this.projectName, 
    @required this.customerName, 
    @required this.ownBy,
    });
  @override
  // TODO: implement props
  List<Object> get props => [
    equipments,
    jobId,
    nonSearch,
    projectNameTh,
    siteCode,
    projectNameEn,
    services,
    projectName,
    customerName,
    ownBy,
  ];

  // factory Job.fromJson(Map<String,dynamic> json){
  //   return Job(
  //     equipments:json['equipments'],
      
  //   );
  // }
}

class Equipment extends Equatable {
  final List<Img> imgList;
  final String name;
  final String model;
  final String type;
  final String brand;

  Equipment({
    @required this.imgList, 
    @required this.name, 
    @required this.model, 
    @required this.type, 
    @required this.brand,
    });
  @override
  // TODO: implement props
  List<Object> get props => [
    imgList,
    name,
    model,
    type,
    brand,
  ];
}

class Img extends Equatable {
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class Service extends Equatable {
  final String edsCircuitNumber;
  final String name;
  final String ipRanId;
  final String nonMobileId;
  final String referenceId;

  Service({
    @required this.edsCircuitNumber,
    @required this.name,
    @required this.ipRanId,
    @required this.nonMobileId,
    @required this.referenceId,
  });
  @override
  // TODO: implement props
  List<Object> get props => [
    edsCircuitNumber,
    name,
    ipRanId,
    nonMobileId,
    referenceId,
  ];
}
