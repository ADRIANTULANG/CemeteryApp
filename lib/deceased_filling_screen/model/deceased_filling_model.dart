import 'dart:convert';

import 'package:image_picker/image_picker.dart';

List<AgeModel> ageModelFromJson(String str) =>
    List<AgeModel>.from(json.decode(str).map((x) => AgeModel.fromJson(x)));

String ageModelToJson(List<AgeModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AgeModel {
  AgeModel({
    required this.age,
  });

  int age;

  factory AgeModel.fromJson(Map<String, dynamic> json) => AgeModel(
        age: json["age"],
      );

  Map<String, dynamic> toJson() => {
        "age": age,
      };
}

List<ImageListModel> imageModelListFromJson(String str) =>
    List<ImageListModel>.from(
        json.decode(str).map((x) => ImageListModel.fromJson(x)));

String imageModelListToJson(List<ImageListModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImageListModel {
  ImageListModel({
    required this.imagePath,
    required this.imageFile,
  });

  String imagePath;
  XFile? imageFile;

  factory ImageListModel.fromJson(Map<String, dynamic> json) => ImageListModel(
        imagePath: json["imagePath"],
        imageFile: json["imageFile"],
      );

  Map<String, dynamic> toJson() => {
        "imagePath": imagePath,
        "imageFile": imageFile,
      };
}
