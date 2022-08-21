import 'package:cemeteryapp/storage_services.dart';
import 'package:get/get.dart';

import '../api/reservation_booking_api.dart';
import '../model/reservation_booking_model.dart';

class ReservationBookingController extends GetxController {
  RxList<ReservationBookingModel> reservationList =
      <ReservationBookingModel>[].obs;

  RxBool isloading = true.obs;

  @override
  void onInit() {
    getReservation();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getReservation() async {
    var result = await ReservationBookingApi.getReservation(
        clientID: Get.find<StorageServices>().storage.read('clientId'));
    reservationList.assignAll(result);
    isloading.value = false;
  }
}
