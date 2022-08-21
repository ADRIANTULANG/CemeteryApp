import 'dart:convert';

List<ReservationBookingModel> reservationBookingModelFromJson(String str) =>
    List<ReservationBookingModel>.from(
        json.decode(str).map((x) => ReservationBookingModel.fromJson(x)));

String reservationBookingModelToJson(List<ReservationBookingModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ReservationBookingModel {
  ReservationBookingModel({
    required this.resId,
    required this.resStatus,
    required this.dcsFname,
    required this.dcsMname,
    required this.dcsLname,
    required this.lotPrice,
    required this.cmName,
  });

  String resId;
  String resStatus;
  String dcsFname;
  String dcsMname;
  String dcsLname;
  String lotPrice;
  String cmName;

  factory ReservationBookingModel.fromJson(Map<String, dynamic> json) =>
      ReservationBookingModel(
        resId: json["res_id"],
        resStatus: json["res_status"],
        dcsFname: json["dcs_fname"],
        dcsMname: json["dcs_mname"],
        dcsLname: json["dcs_lname"],
        lotPrice: json["lot_price"],
        cmName: json["cm_name"],
      );

  Map<String, dynamic> toJson() => {
        "res_id": resId,
        "res_status": resStatus,
        "dcs_fname": dcsFname,
        "dcs_mname": dcsMname,
        "dcs_lname": dcsLname,
        "lot_price": lotPrice,
        "cm_name": cmName,
      };
}
