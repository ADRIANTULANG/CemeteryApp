import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:cemeteryapp/endPoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CustomerRegistrationApi {
  static var client = http.Client();

  static Future<bool> createCustomerAccount({
    required String firstname,
    required String middlename,
    required String lastname,
    required String email,
    required String imageName,
    required String username,
    required String password,
  }) async {
    print(firstname);
    print(middlename);
    print(lastname);
    print(email);
    print(imageName);
    print(username);
    print(password);
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/create-client.php'),
        body: {
          "ClientFirstName": firstname.toString(),
          "ClientMiddlename": middlename.toString(),
          "ClientLastname": lastname.toString(),
          "email": email.toString(),
          "ClientImage": imageName.toString(),
          "username": username.toString(),
          "password": password.toString(),
        },
      );

      if (jsonDecode(response.body)['message'] == "Success") {
        return true;
      } else {
        return false;
      }
    } on TimeoutException catch (_) {
      Get.snackbar(
        "Create Customer Account Error: Timeout",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } on SocketException catch (_) {
      print(_);
      Get.snackbar(
        "Create Customer Account: Socket",
        "Oops, something went wrong. Please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
    } catch (e) {
      Get.snackbar(
        "Create Customer Account",
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

  static Future checkEmail({
    required String email,
  }) async {
    try {
      var response = await client.post(
        Uri.parse('${AppEndpoint.endPointDomain}/check-client-email.php'),
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
        Uri.parse('${AppEndpoint.endPointDomain}/check-client-username.php'),
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
