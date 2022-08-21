import 'package:cemeteryapp/storage_services.dart';
import 'package:get/get.dart';

import '../api/home_screen_cemetery_api.dart';
import '../model/homes_screen_cemetery_model.dart';

class HomeScreenCemeteryController extends GetxController {
  RxList<CemeteryLot> cemeteryLot = <CemeteryLot>[].obs;

  @override
  void onInit() {
    getCemeteryLot();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCemeteryLot() async {
    cemeteryLot.assignAll(await HomescreenCemeteryApi.getCemeteryLot(
        cemeteryID: Get.find<StorageServices>().storage.read("cementeryId")));
  }
}
