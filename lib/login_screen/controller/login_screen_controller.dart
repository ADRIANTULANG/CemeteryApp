import 'package:cemeteryapp/home_screen_cemetery/view/home_screen_cemetery_view.dart';
import 'package:cemeteryapp/login_screen/api/login_screen_api.dart';
import 'package:cemeteryapp/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home_screen/view/home_screen_view.dart';

class LoginController extends GetxController {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  RxBool isGettingCredentials = false.obs;
  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
  }

  login({required String username, required String password}) async {
    isGettingCredentials.value = true;
    var result = await LoginApi.login(username: username, password: password);
    if (result.length == 0) {
      Get.snackbar(
        "User did not exist!",
        "Please check your credentials",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      await Get.find<StorageServices>().saveCredentials(
        accntId: result[0].accntId,
        username: result[0].username,
        password: result[0].password,
        userId: result[0].userId,
        usertypeId: result[0].usertypeId,
        status: result[0].status,
        code: result[0].code,
      );
      if (result[0].usertypeId.toString() == "2") {
        var cemeteryDetails =
            await LoginApi.getCemeteryDetails(cemeteryID: result[0].userId);
        await Get.find<StorageServices>().saveCemeteryDetails(
            cementeryId: cemeteryDetails[0].cementeryId,
            cmName: cemeteryDetails[0].cmName,
            cmLongitude: cemeteryDetails[0].cmLongitude,
            cmLatitude: cemeteryDetails[0].cmLatitude,
            cDescription: cemeteryDetails[0].cDescription,
            cmEmail: cemeteryDetails[0].cmEmail,
            cmAddress: cemeteryDetails[0].cmAddress,
            cemImage: cemeteryDetails[0].cemImage);
        Get.offAll(() => HomescreenCemeteryView());
      } else if (result[0].usertypeId.toString() == "3") {
        var clientDetails =
            await LoginApi.getClientDetails(clientID: result[0].userId);
        if (clientDetails.length != 0) {
          await Get.find<StorageServices>().saveClientCredentials(
            clientId: clientDetails[0].clientId,
            clientFirstName: clientDetails[0].clientFirstName,
            clientMiddlename: clientDetails[0].clientMiddlename,
            clientLastname: clientDetails[0].clientLastname,
            email: clientDetails[0].email,
            clientImage: clientDetails[0].clientImage,
          );
          Get.offAll(() => HomeScreenView());
        }
      } else {
        Get.snackbar(
          "Message",
          "Admin users must log in on web. Thank you!",
          colorText: Colors.white,
          backgroundColor: Colors.lightGreen,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
    isGettingCredentials.value = false;
    //  Get.to(() => HomeScreenView());
  }
}
