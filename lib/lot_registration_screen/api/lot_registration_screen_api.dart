import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cemeteryapp/endPoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LotRegistrationApi {
  static var client = http.Client();

  static Future createCemeteryLot({
    required String cemeteryID,
    required String lat,
    required String long,
    required String price,
    required String description,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/create-cemetery-lot.php'),
        body: {
          "cementery_id": cemeteryID.toString(),
          "lot_latitude": lat.toString(),
          "lot_longitude": long.toString(),
          "lot_price": price.toString(),
          "lot_description": description.toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
      } else {
        return "Error";
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Create Cemetery Lot Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return "Error";
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Create Cemetery Lot Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return "Error";
    } catch (e) {
      Get.snackbar(
        "Create Cemetery Lot Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return "Error";
    }
  }
}
