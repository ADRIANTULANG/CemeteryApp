import 'dart:convert';

List<CemeteryList> cemeteryListFromJson(String str) => List<CemeteryList>.from(
    json.decode(str).map((x) => CemeteryList.fromJson(x)));

String cemeteryListToJson(List<CemeteryList> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CemeteryList {
  CemeteryList({
    required this.id,
    required this.name,
    required this.longitude,
    required this.latitude,
    required this.companyDescription,
    required this.cmEmail,
    required this.contactNumber,
    required this.address,
    required this.image,
  });

  String id;
  String name;
  String longitude;
  String latitude;
  String companyDescription;

  String cmEmail;
  String contactNumber;
  String address;
  String image;

  factory CemeteryList.fromJson(Map<String, dynamic> json) => CemeteryList(
        id: json["id"],
        name: json["name"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        companyDescription: json["companyDescription"],
        cmEmail: json["cm_email"],
        contactNumber: json["contactNumber"],
        address: json["address"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "longitude": longitude,
        "latitude": latitude,
        "companyDescription": companyDescription,
        "cm_email": cmEmail,
        "contactNumber": contactNumber,
        "address": address,
        "image": image,
      };
}

List<DeceasedModel> deceasedModelFromJson(String str) =>
    List<DeceasedModel>.from(
        json.decode(str).map((x) => DeceasedModel.fromJson(x)));

String deceasedModelToJson(List<DeceasedModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeceasedModel {
  DeceasedModel({
    required this.dcsFname,
    required this.dcsMname,
    required this.dcsLname,
    required this.lotLatitude,
    required this.lotLongitude,
    required this.cementeryId,
  });

  String dcsFname;
  String dcsMname;
  String dcsLname;
  String lotLatitude;
  String lotLongitude;
  String cementeryId;

  factory DeceasedModel.fromJson(Map<String, dynamic> json) => DeceasedModel(
        dcsFname: json["dcs_fname"],
        dcsMname: json["dcs_mname"],
        dcsLname: json["dcs_lname"],
        lotLatitude: json["lot_latitude"],
        lotLongitude: json["lot_longitude"],
        cementeryId: json["cementery_id"],
      );

  Map<String, dynamic> toJson() => {
        "dcs_fname": dcsFname,
        "dcs_mname": dcsMname,
        "dcs_lname": dcsLname,
        "lot_latitude": lotLatitude,
        "lot_longitude": lotLongitude,
        "cementery_id": cementeryId,
      };
}
