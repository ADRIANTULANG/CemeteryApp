import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cemeteryapp/endPoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../model/homes_screen_cemetery_model.dart';

class HomescreenCemeteryApi {
  static var client = http.Client();
//
  static Future<List<CemeteryLot>> getCemeteryLot({
    required String cemeteryID,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/get-cemetery-lots.php'),
        body: {
          "cemeteryID": cemeteryID.toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return cemeteryLotFromJson(
            jsonEncode(jsonDecode(response.body)['data']));
      } else {
        return [];
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Get Cemetery Lot Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Get Cemetery Lot Error: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    } catch (e) {
      Get.snackbar(
        "Get Cemetery Lot Error",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return [];
    }
  }
}
