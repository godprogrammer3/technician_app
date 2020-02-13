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

  factory Job.fromJson(Map<String, dynamic> json) {
    final equipmentList = json['equipments'];
    final List<Equipment> equipments = List<dynamic>();
    for(int i = 0; i < equipmentList.length;i++){
      equipments.add(Equipment.fromJson(equipmentList[i]));
    }
    final serviceList = json['services'];
    final List<Service> services = List<dynamic>();
    for(int i = 0; i < serviceList.length;i++){
      services.add(Service.fromJson(serviceList[i]));
    }
    return Job(
      equipments: equipments,
      jobId: json['jobId'],
      nonSearch: json['nonSearch'],
      projectNameTh: json['projectNameTh'],
      siteCode: json['siteCode'],
      projectNameEn: json['projectNameEn'],
      services: services,
      projectName: json['projectName'],
      customerName: json['customerName'],
      ownBy: json['ownBy'],
    );
  }
}

class Equipment extends Equatable {
  final List<Img> imgs;
  final String name;
  final String model;
  final String type;
  final String brand;

  Equipment({
    @required this.imgs,
    @required this.name,
    @required this.model,
    @required this.type,
    @required this.brand,
  });
  @override
  // TODO: implement props
  List<Object> get props => [
        imgs,
        name,
        model,
        type,
        brand,
      ];

  factory Equipment.fromJson(Map<String, dynamic> json) {
    final imgList = json['imgs'];
    List<Img> imgs = List<dynamic>();
    for( int i = 0; i<imgList.length; i++){
      imgs.add( Img.fromJson(imgList[i]));
    }

    return Equipment(
      imgs: imgs,
      name: json['name'],
      model: json['model'],
      type: json['type'],
      brand: json['brand'],
    );
  }
}

class Img extends Equatable {
  Img();
  @override
  // TODO: implement props
  List<Object> get props => null;
  factory Img.fromJson(Map<String, dynamic> json) {
    return Img();
  }
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
  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
      edsCircuitNumber: json['edsCircuitNumber'],
      name: json['name'],
      ipRanId: json['ipRanId'],
      nonMobileId: json['nonMobileId'],
      referenceId: json['referenceId'],
    );
  }
}
