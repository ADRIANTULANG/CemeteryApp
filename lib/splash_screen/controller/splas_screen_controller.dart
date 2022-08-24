import 'dart:async';

import 'package:cemeteryapp/storage_services.dart';
import 'package:get/get.dart';

import '../../frequently_ask_questions_screen/view/frequently_ask_questions_view_fresh.dart';
import '../../home_screen/view/home_screen_view.dart';
import '../../home_screen_cemetery/view/home_screen_cemetery_view.dart';
import '../../login_screen/view/login_screen_view.dart';

class SpashScreenController extends GetxController {
  Timer? timer;

  @override
  void onInit() {
    timerfunction();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  timerfunction() {
    Timer(Duration(seconds: 8), () {
      if (Get.find<StorageServices>().storage.read("accntId") != null) {
        if (Get.find<StorageServices>().storage.read("usertypeId").toString() ==
            "2") {
          Get.offAll(() => HomescreenCemeteryView());
        } else if (Get.find<StorageServices>()
                .storage
                .read("usertypeId")
                .toString() ==
            "3") {
          Get.offAll(() => HomeScreenView());
        } else {}
      } else {
        if (Get.find<StorageServices>().storage.read("isAlreadyDisplay") ==
            true) {
          Get.offAll(() => LoginScreen());
        } else {
          Get.offAll(() => FrequestAskQuestionsViewFresh());
        }
      }
    });
  }
}
