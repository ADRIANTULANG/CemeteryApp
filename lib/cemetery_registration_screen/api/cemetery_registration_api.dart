import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cemeteryapp/endPoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CemeteryRegistrationApi {
  static var client = http.Client();

  static Future<String> createCemeteryAccount({
    required String companyName,
    required String longitude,
    required String latitude,
    required String description,
    required String email,
    required String address,
    required String imageName,
    required String username,
    required String password,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/create-cemetery.php'),
        body: {
          "cm_name": companyName.toString(),
          "cm_longitude": longitude.toString(),
          "cm_latitude": latitude.toString(),
          "cm_email": email.toString(),
          "c_description": description.toString(),
          "cm_address": address.toString(),
          "cem_image": imageName.toString(),
          "username": username.toString(),
          "password": password.toString(),
        },
      );
      print("response: ${response.body}");
      if (jsonDecode(response.body)['message'] == "Success") {
        return jsonDecode(response.body)['last_id'].toString();
      } else {
        return "Error";
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Create Cemetery Account Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return "Error";
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Create Cemetery Account: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return "Error";
    } catch (e) {
      Get.snackbar(
        "Create Cemetery Account",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return "Error";
    }
  }

  static Future cemeteryDocuments({
    required String cemeteryImage,
    required String cemeteryDescription,
    required String cemeteryID,
  }) async {
    try {
      var response = await client.post(
        Uri.parse(
            '${AppEndpoint.endPointDomain}/create-cemetery-documents.php'),
        body: {
          "cd_image": cemeteryImage.toString(),
          "cd_description": cemeteryDescription.toString(),
          "cementery_id": cemeteryID.toString(),
        },
      );
      print("response: ${response.body}");
      if (jsonDecode(response.body)['message'] == "Success") {
      } else {}
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Create Cemetery Documents Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Create Cemetery Documents: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      Get.snackbar(
        "Create Cemetery Documents",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  static Future<bool> uploadImage(
      {required String imagename, required String filepath}) async {
    var request = http.MultipartRequest(
        'POST',
        Uri.parse(
            'https://burialreservationandmapping.online/image-upload.php'));
    request.fields['name'] = imagename;
    var pic = await http.MultipartFile.fromPath("image", filepath);
    request.files.add(pic);
    var response = await request.send();
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future checkEmail({
    required String email,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/check-cemetery-email.php'),
        body: {
          "email": email.toString(),
        },
      );
      print("response: ${response.body}");
      if (jsonDecode(response.body)['message'] == "Success") {
        var count = jsonDecode(response.body)['data'][0]['counts'];

        return int.parse(count.toString());
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Check Email Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Check Email: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        "Check Email",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }

  static Future checkUsername({
    required String username,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/check-cemetery-username.php'),
        body: {
          "username": username.toString(),
        },
      );
      print("response: ${response.body}");
      if (jsonDecode(response.body)['message'] == "Success") {
        var count = jsonDecode(response.body)['data'][0]['counts'];

        return int.parse(count.toString());
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Check Username Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Check Username: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        "Check Username",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }
}
