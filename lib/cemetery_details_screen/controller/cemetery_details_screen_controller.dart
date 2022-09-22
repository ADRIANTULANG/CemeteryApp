import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../api/cemetery_details_api.dart';
import '../model/cemetery_details_model.dart';

class CemeteryDetailsController extends GetxController {
  Completer<GoogleMapController> cemetery_mapcontroller = Completer();
  GoogleMapController? googleMapController;
  List<CemeteryLotModel> lotList = <CemeteryLotModel>[].obs;

  RxString cemeteryID = "".obs;
  RxDouble store_Latitude = 0.0.obs;
  RxDouble store_Longitude = 0.0.obs;
  RxString cemeteryName = "".obs;
  RxString cemeteryAddress = "".obs;
  RxString cemeteryContactNumber = "".obs;
  RxBool isLoading = true.obs;

  Timer? debounce;

  RxList<Marker> cemetery_markers = <Marker>[].obs;
  TextEditingController deceasedTextfield = TextEditingController();
  @override
  void onInit() async {
    cemeteryID.value = await Get.arguments["cemeteryID"];
    store_Latitude.value = await Get.arguments['storeLatitude'];
    store_Longitude.value = await Get.arguments['storeLongitude'];
    cemeteryName.value = await Get.arguments['cemeteryName'];
    cemeteryAddress.value = await Get.arguments['cemeteryAddress'];
    cemeteryContactNumber.value = await Get.arguments['cemeteryContactNumber'];
    getCemeteryLots();
    print("latt" + store_Latitude.toString());
    print("longg" + store_Longitude.toString());

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCemeteryLots() async {
    var result =
        await CemeteryDetailsApi.getCemeteryLots(cemeteryID: cemeteryID.value);
    try {
      lotList.assignAll(result);
    } on Exception catch (e) {
      print(e);
    }
    for (var i = 0; i < lotList.length; i++) {
      cemetery_markers.add(Marker(
          markerId: MarkerId(lotList[i].lotId),
          position: LatLng(double.parse(lotList[i].lotLatitude),
              double.parse(lotList[i].lotLongitude)),
          infoWindow: InfoWindow(
              title: cemeteryName + " Lot" + lotList[i].lotId,
              snippet: lotList[i].lotDescription)));
    }
    isLoading(false);
  }

  Future<void> goToTheLocation(
      {required double lat, required double long}) async {
    googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(lat, long),
            tilt: 59.440717697143555,
            zoom: 19.151926040649414)));
  }

  Future<void> makePhoneCall({required String phoneNumber}) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
}
