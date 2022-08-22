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
    required this.dcsId,
    required this.dcsFname,
    required this.dcsMname,
    required this.dcsLname,
    required this.schedOfBurial,
    required this.lotLongitude,
    required this.lotLatitude,
    required this.lotPrice,
  });

  String resId;
  String resLotId;
  String resStatus;
  String dcsFname;
  String dcsMname;
  String dcsLname;
  String dcsId;
  DateTime schedOfBurial;
  String lotLongitude;
  String lotLatitude;
  String lotPrice;

  factory CemeteryReservationListModel.fromJson(Map<String, dynamic> json) =>
      CemeteryReservationListModel(
        resId: json["res_id"],
        resLotId: json["res_lot_id"],
        resStatus: json["res_status"],
        dcsFname: json["dcs_fname"],
        dcsMname: json["dcs_mname"],
        dcsLname: json["dcs_lname"],
        dcsId: json["dcs_id"],
        schedOfBurial: DateTime.parse(json["sched_of_burial"]),
        lotLongitude: json["lot_longitude"],
        lotLatitude: json["lot_latitude"],
        lotPrice: json["lot_price"],
      );

  Map<String, dynamic> toJson() => {
        "res_id": resId,
        "res_lot_id": resLotId,
        "res_status": resStatus,
        "dcs_fname": dcsFname,
        "dcs_mname": dcsMname,
        "dcs_lname": dcsLname,
        "dcs_id": dcsId,
        "sched_of_burial":
            "${schedOfBurial.year.toString().padLeft(4, '0')}-${schedOfBurial.month.toString().padLeft(2, '0')}-${schedOfBurial.day.toString().padLeft(2, '0')}",
        "lot_longitude": lotLongitude,
        "lot_latitude": lotLatitude,
        "lot_price": lotPrice,
      };
}
