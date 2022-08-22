import 'package:cemeteryapp/color_class.dart';
import 'package:cemeteryapp/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home_screen_cemetery/controller/home_screen_cemetery_controller.dart';
import '../api/cemetery_reservation_list_api.dart';
import '../model/cemetery_reservation_list_model.dart';

class CemeteryReservationListController extends GetxController {
  RxList<CemeteryReservationListModel> reservationList =
      <CemeteryReservationListModel>[].obs;
  @override
  void onInit() {
    getReservations();
    super.onInit();
  }

  @override
  void onClose() {
    Get.find<HomeScreenCemeteryController>().getCemeteryLot();
    super.onClose();
  }

  getReservations() async {
    reservationList.assignAll(await CemeteryReservationListApi.getReservations(
        cemeteryID: Get.find<StorageServices>().storage.read("cementeryId")));
  }

  approvedReservation({
    required String res_id,
    required String lot_id,
    required String dcs_id,
  }) async {
    var result = await CemeteryReservationListApi.updateApprovedReservation(
        cemeteryID: Get.find<StorageServices>().storage.read("cementeryId"),
        res_id: res_id,
        lot_id: lot_id,
        dcs_id: dcs_id);
    if (result == true) {
      Get.snackbar(
        "Message",
        "Succesfully Approved",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
      getReservations();
    }
  }

  deniedReservation({
    required String res_id,
  }) async {
    var result = await CemeteryReservationListApi.updateDeniedReservation(
      res_id: res_id,
    );
    if (result == true) {
      Get.snackbar(
        "Message",
        "Succesfully Denied",
        colorText: Colors.white,
        backgroundColor: AppColor.mainColors,
        snackPosition: SnackPosition.TOP,
      );
      getReservations();
    }
  }
}
