import 'dart:convert';

List<LoginModel> loginModelFromJson(String str) =>
    List<LoginModel>.from(json.decode(str).map((x) => LoginModel.fromJson(x)));

String loginModelToJson(List<LoginModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LoginModel {
  LoginModel({
    required this.accntId,
    required this.username,
    required this.password,
    required this.userId,
    required this.usertypeId,
    required this.status,
    required this.code,
  });

  String accntId;
  String username;
  String password;
  String userId;
  String usertypeId;
  String status;
  String code;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        accntId: json["accnt_id"],
        username: json["username"],
        password: json["password"],
        userId: json["userID"],
        usertypeId: json["usertypeID"],
        status: json["status"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "accnt_id": accntId,
        "username": username,
        "password": password,
        "userID": userId,
        "usertypeID": usertypeId,
        "status": status,
        "code": code,
      };
}

List<ClientModel> clientModelFromJson(String str) => List<ClientModel>.from(
    json.decode(str).map((x) => ClientModel.fromJson(x)));

String clientModelToJson(List<ClientModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ClientModel {
  ClientModel({
    required this.clientId,
    required this.clientFirstName,
    required this.clientMiddlename,
    required this.clientLastname,
    required this.email,
    required this.clientImage,
  });

  String clientId;
  String clientFirstName;
  String clientMiddlename;
  String clientLastname;
  String email;
  String clientImage;

  factory ClientModel.fromJson(Map<String, dynamic> json) => ClientModel(
        clientId: json["ClientID"],
        clientFirstName: json["ClientFirstName"],
        clientMiddlename: json["ClientMiddlename"],
        clientLastname: json["ClientLastname"],
        email: json["email"],
        clientImage: json["ClientImage"],
      );

  Map<String, dynamic> toJson() => {
        "ClientID": clientId,
        "ClientFirstName": clientFirstName,
        "ClientMiddlename": clientMiddlename,
        "ClientLastname": clientLastname,
        "email": email,
        "ClientImage": clientImage,
      };
}

List<CemeteryDetails> cemeteryDetailsFromJson(String str) =>
    List<CemeteryDetails>.from(
        json.decode(str).map((x) => CemeteryDetails.fromJson(x)));

String cemeteryDetailsToJson(List<CemeteryDetails> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CemeteryDetails {
  CemeteryDetails({
    required this.cementeryId,
    required this.cmName,
    required this.cmLongitude,
    required this.cmLatitude,
    required this.cDescription,
    required this.cmEmail,
    required this.cmAddress,
    required this.cemImage,
  });

  String cementeryId;
  String cmName;
  String cmLongitude;
  String cmLatitude;
  String cDescription;

  String cmEmail;
  String cmAddress;
  String cemImage;

  factory CemeteryDetails.fromJson(Map<String, dynamic> json) =>
      CemeteryDetails(
        cementeryId: json["cementery_id"],
        cmName: json["cm_name"],
        cmLongitude: json["cm_longitude"],
        cmLatitude: json["cm_latitude"],
        cDescription: json["c_description"],
        cmEmail: json["cm_email"],
        cmAddress: json["cm_address"],
        cemImage: json["cem_image"],
      );

  Map<String, dynamic> toJson() => {
        "cementery_id": cementeryId,
        "cm_name": cmName,
        "cm_longitude": cmLongitude,
        "cm_latitude": cmLatitude,
        "c_description": cDescription,
        "cm_email": cmEmail,
        "cm_address": cmAddress,
        "cem_image": cemImage,
      };
}
