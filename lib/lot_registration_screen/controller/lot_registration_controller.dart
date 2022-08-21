import 'dart:async';

import 'package:cemeteryapp/storage_services.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../home_screen_cemetery/controller/home_screen_cemetery_controller.dart';
import '../api/lot_registration_screen_api.dart';

class LotRegistrationController extends GetxController {
  Completer<GoogleMapController> mapcontroller = Completer();
  GoogleMapController? googleMapController;
  RxList<Marker> markers = <Marker>[].obs;

  TextEditingController lotprice = TextEditingController();
  TextEditingController lotDescription = TextEditingController();

  double selected_lat = 0.0;
  double selected_long = 0.0;

  RxBool isCreating = false.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  ontap_GoogleMap({required double latitude, required double longitude}) async {
    markers.clear();
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      for (var i = 0; i < placemarks.length; i++) {
        print(placemarks[i].country);
        print(placemarks[i].locality);
        print(placemarks[i].subLocality);
        print("----------");
      }
    } on Exception catch (e) {
      print("catch exception $e");
    }
    markers.add(Marker(
      markerId: MarkerId("new"),
      position: LatLng(latitude, longitude),
    ));
    googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(latitude, longitude),
            tilt: 59.440717697143555,
            zoom: 19.151926040649414)));
    selected_lat = latitude;
    selected_long = longitude;
  }

  createCemeteryLot() async {
    isCreating.value = true;
    await LotRegistrationApi.createCemeteryLot(
        cemeteryID:
            Get.find<StorageServices>().storage.read("cementeryId").toString(),
        lat: selected_lat.toString(),
        long: selected_long.toString(),
        price: lotprice.text,
        description: lotDescription.text);
    isCreating.value = false;
    Get.find<HomeScreenCemeteryController>().getCemeteryLot();
    Get.back();
  }
}
