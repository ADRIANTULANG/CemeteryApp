import 'dart:convert';

List<CemeteryDeceasedModel> cemeteryDeceasedModelFromJson(String str) =>
    List<CemeteryDeceasedModel>.from(
        json.decode(str).map((x) => CemeteryDeceasedModel.fromJson(x)));

String cemeteryDeceasedModelToJson(List<CemeteryDeceasedModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CemeteryDeceasedModel {
  CemeteryDeceasedModel({
    required this.dcsDoBirth,
    required this.dcsDoDeath,
    required this.dcsAge,
    required this.dcsAddress,
    required this.dcsFname,
    required this.dcsMname,
    required this.dcsLname,
    required this.lotLatitude,
    required this.lotLongitude,
    required this.cementeryId,
    required this.deceasedFullname,
  });

  DateTime dcsDoBirth;
  DateTime dcsDoDeath;
  String dcsAge;
  String dcsAddress;
  String dcsFname;
  String dcsMname;
  String dcsLname;
  String lotLatitude;
  String lotLongitude;
  String cementeryId;
  String deceasedFullname;

  factory CemeteryDeceasedModel.fromJson(Map<String, dynamic> json) =>
      CemeteryDeceasedModel(
        dcsDoBirth: DateTime.parse(json["dcs_do_birth"]),
        dcsDoDeath: DateTime.parse(json["dcs_do_death"]),
        dcsAge: json["dcs_age"],
        dcsAddress: json["dcs_address"],
        dcsFname: json["dcs_fname"],
        dcsMname: json["dcs_mname"],
        dcsLname: json["dcs_lname"],
        lotLatitude: json["lot_latitude"],
        lotLongitude: json["lot_longitude"],
        cementeryId: json["cementery_id"],
        deceasedFullname: json["dcs_fname"].toString() +
            " " +
            json["dcs_mname"].toString() +
            " " +
            json["dcs_lname"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "dcs_do_birth":
            "${dcsDoBirth.year.toString().padLeft(4, '0')}-${dcsDoBirth.month.toString().padLeft(2, '0')}-${dcsDoBirth.day.toString().padLeft(2, '0')}",
        "dcs_do_death":
            "${dcsDoDeath.year.toString().padLeft(4, '0')}-${dcsDoDeath.month.toString().padLeft(2, '0')}-${dcsDoDeath.day.toString().padLeft(2, '0')}",
        "dcs_age": dcsAge,
        "dcs_address": dcsAddress,
        "dcs_fname": dcsFname,
        "dcs_mname": dcsMname,
        "dcs_lname": dcsLname,
        "lot_latitude": lotLatitude,
        "lot_longitude": lotLongitude,
        "cementery_id": cementeryId,
        "deceasedFullname": deceasedFullname,
      };
}
