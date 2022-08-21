import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cemeteryapp/endPoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DeceasedFillingApi {
  static var client = http.Client();
// <List<LoginModel>>
  static Future fileDeceased({
    required String dcs_fname,
    required String dcs_lname,
    required String dcs_mname,
    required String dcs_civil_status,
    required String dcs_age,
    required String dcs_gender,
    required String dcs_address,
    required String dcs_do_birth,
    required String dcs_do_death,
    required String sched_of_burial,
    required String lot_id,
    required String clientID,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/create-deceased.php'),
        body: {
          "dcs_fname": dcs_fname.toString(),
          "dcs_lname": dcs_lname.toString(),
          "dcs_mname": dcs_mname.toString(),
          "dcs_civil_status": dcs_civil_status.toString(),
          "dcs_age": dcs_age.toString(),
          "dcs_gender": dcs_gender.toString(),
          "dcs_address": dcs_address.toString(),
          "dcs_do_birth": dcs_do_birth.toString(),
          "dcs_do_death": dcs_do_death.toString(),
          "sched_of_burial": sched_of_burial.toString(),
          "lot_id": lot_id.toString(),
          "clientID": clientID.toString(),
        },
      );
      print(response.body);
      if (jsonDecode(response.body)['message'] == "Success") {
        return jsonDecode(response.body)['deceasedID'].toString();
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "File Deceased Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "File Deceased Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        "File Deceased Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
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

  static Future<bool> createDeceasedDocuments({
    required String cd_image,
    required String cd_description,
    required String cementery_id,
  }) async {
    try {
      var response = await client.post(
        Uri.parse(
            '${AppEndpoint.endPointDomain}/create-deceased-documents.php'),
        body: {
          "cd_image": cd_image.toString(),
          "cd_description": cd_description.toString(),
          "cementery_id": cementery_id.toString(),
        },
      );
      print(response.body);
      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Create Deceased Documents Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Create Deceased Documents Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        "Create Deceased Documents Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    }
  }
}
