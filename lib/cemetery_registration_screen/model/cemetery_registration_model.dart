import 'dart:convert';

import 'package:image_picker/image_picker.dart';

List<ImageModel> imageModelFromJson(String str) =>
    List<ImageModel>.from(json.decode(str).map((x) => ImageModel.fromJson(x)));

String imageModelToJson(List<ImageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ImageModel {
  ImageModel({
    required this.imagePath,
    required this.imageFile,
  });

  String imagePath;
  XFile? imageFile;

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        imagePath: json["imagePath"],
        imageFile: json["imageFile"],
      );

  Map<String, dynamic> toJson() => {
        "imagePath": imagePath,
        "imageFile": imageFile,
      };
}
