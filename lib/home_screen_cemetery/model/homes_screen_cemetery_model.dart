import 'dart:convert';

List<CemeteryLot> cemeteryLotFromJson(String str) => List<CemeteryLot>.from(
    json.decode(str).map((x) => CemeteryLot.fromJson(x)));

String cemeteryLotToJson(List<CemeteryLot> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CemeteryLot {
  CemeteryLot({
    required this.lotId,
    required this.lotType,
    required this.lotLongitude,
    required this.lotLatitude,
    required this.cementeryId,
    required this.status,
    required this.lotPrice,
    required this.lotDescription,
  });

  String lotId;
  String lotType;
  String lotLongitude;
  String lotLatitude;
  String cementeryId;
  String status;
  String lotPrice;
  String lotDescription;

  factory CemeteryLot.fromJson(Map<String, dynamic> json) => CemeteryLot(
        lotId: json["lot_id"],
        lotType: json["lot_type"],
        lotLongitude: json["lot_longitude"],
        lotLatitude: json["lot_latitude"],
        cementeryId: json["cementery_id"],
        status: json["status"],
        lotPrice: json["lot_price"],
        lotDescription: json["lot_description"],
      );

  Map<String, dynamic> toJson() => {
        "lot_id": lotId,
        "lot_type": lotType,
        "lot_longitude": lotLongitude,
        "lot_latitude": lotLatitude,
        "cementery_id": cementeryId,
        "status": status,
        "lot_price": lotPrice,
        "lot_description": lotDescription,
      };
}
