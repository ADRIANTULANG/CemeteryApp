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
    required this.imageDescription,
  });

  String imagePath;
  XFile? imageFile;
  String imageDescription;
  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        imagePath: json["imagePath"],
        imageFile: json["imageFile"],
        imageDescription: json["imageDescription"],
      );

  Map<String, dynamic> toJson() => {
        "imagePath": imagePath,
        "imageFile": imageFile,
        "imageDescription": imageDescription,
      };
}
