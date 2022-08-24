import 'dart:convert';

List<CemeteryReservationListModel> cemeteryReservationListModelFromJson(
        String str) =>
    List<CemeteryReservationListModel>.from(
        json.decode(str).map((x) => CemeteryReservationListModel.fromJson(x)));

String cemeteryReservationListModelToJson(
        List<CemeteryReservationListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CemeteryReservationListModel {
  CemeteryReservationListModel({
    required this.resId,
    required this.resLotId,
    required this.resStatus,
    required this.dcsFname,
    required this.dcsMname,
    required this.dcsLname,
    required this.schedOfBurial,
    required this.dcsId,
    required this.lotLongitude,
    required this.lotLatitude,
    required this.lotPrice,
    required this.dcsCivilStatus,
    required this.dcsAge,
    required this.dcsGender,
    required this.dcsAddress,
    required this.dcsDoBirth,
    required this.dcsDoDeath,
  });

  String resId;
  String resLotId;
  String resStatus;
  String dcsFname;
  String dcsMname;
  String dcsLname;
  DateTime schedOfBurial;
  String dcsId;
  String lotLongitude;
  String lotLatitude;
  String lotPrice;
  String dcsCivilStatus;
  String dcsAge;
  String dcsGender;
  String dcsAddress;
  DateTime dcsDoBirth;
  DateTime dcsDoDeath;

  factory CemeteryReservationListModel.fromJson(Map<String, dynamic> json) =>
      CemeteryReservationListModel(
        resId: json["res_id"],
        resLotId: json["res_lot_id"],
        resStatus: json["res_status"],
        dcsFname: json["dcs_fname"],
        dcsMname: json["dcs_mname"],
        dcsLname: json["dcs_lname"],
        schedOfBurial: DateTime.parse(json["sched_of_burial"]),
        dcsId: json["dcs_id"],
        lotLongitude: json["lot_longitude"],
        lotLatitude: json["lot_latitude"],
        lotPrice: json["lot_price"],
        dcsCivilStatus: json["dcs_civil_status"],
        dcsAge: json["dcs_age"],
        dcsGender: json["dcs_gender"],
        dcsAddress: json["dcs_address"],
        dcsDoBirth: DateTime.parse(json["dcs_do_birth"]),
        dcsDoDeath: DateTime.parse(json["dcs_do_death"]),
      );

  Map<String, dynamic> toJson() => {
        "res_id": resId,
        "res_lot_id": resLotId,
        "res_status": resStatus,
        "dcs_fname": dcsFname,
        "dcs_mname": dcsMname,
        "dcs_lname": dcsLname,
        "sched_of_burial":
            "${schedOfBurial.year.toString().padLeft(4, '0')}-${schedOfBurial.month.toString().padLeft(2, '0')}-${schedOfBurial.day.toString().padLeft(2, '0')}",
        "dcs_id": dcsId,
        "lot_longitude": lotLongitude,
        "lot_latitude": lotLatitude,
        "lot_price": lotPrice,
        "dcs_civil_status": dcsCivilStatus,
        "dcs_age": dcsAge,
        "dcs_gender": dcsGender,
        "dcs_address": dcsAddress,
        "dcs_do_birth":
            "${dcsDoBirth.year.toString().padLeft(4, '0')}-${dcsDoBirth.month.toString().padLeft(2, '0')}-${dcsDoBirth.day.toString().padLeft(2, '0')}",
        "dcs_do_death":
            "${dcsDoDeath.year.toString().padLeft(4, '0')}-${dcsDoDeath.month.toString().padLeft(2, '0')}-${dcsDoDeath.day.toString().padLeft(2, '0')}",
      };
}

List<DeceasedDocuments> deceasedDocumentsFromJson(String str) =>
    List<DeceasedDocuments>.from(
        json.decode(str).map((x) => DeceasedDocuments.fromJson(x)));

String deceasedDocumentsToJson(List<DeceasedDocuments> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeceasedDocuments {
  DeceasedDocuments({
    required this.ddId,
    required this.ddImage,
    required this.ddDescription,
    required this.dcsId,
  });

  String ddId;
  String ddImage;
  String ddDescription;
  String dcsId;

  factory DeceasedDocuments.fromJson(Map<String, dynamic> json) =>
      DeceasedDocuments(
        ddId: json["dd_id"],
        ddImage: json["dd_image"],
        ddDescription: json["dd_description"],
        dcsId: json["dcs_id"],
      );

  Map<String, dynamic> toJson() => {
        "dd_id": ddId,
        "dd_image": ddImage,
        "dd_description": ddDescription,
        "dcs_id": dcsId,
      };
}
