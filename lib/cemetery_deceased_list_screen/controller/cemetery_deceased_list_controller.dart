import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../location_services.dart';
import '../api/cemetery_deceased_list_api.dart';
import '../model/cemetery_deceased_list_model.dart';

class CemeteryDeceasedListControler extends GetxController {
  Completer<GoogleMapController> mapcontroller = Completer();
  GoogleMapController? googleMapController;
  RxList<Marker> markers = <Marker>[].obs;
  TextEditingController deceasedTextfield = TextEditingController();
  Timer? debounce;
  RxString cemeteryID = ''.obs;

  RxList<CemeteryDeceasedModel> deceasedList = <CemeteryDeceasedModel>[].obs;
  RxList<CemeteryDeceasedModel> deceasedList_masterList =
      <CemeteryDeceasedModel>[].obs;
  @override
  void onInit() async {
    cemeteryID.value = await Get.arguments['cemeteryID'];
    await getDeceased();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getDeceased() async {
    var result = await CemeteryDeceasedListApi.getDeceasedOfCemetey(
        cemeteryID: cemeteryID.value);
    deceasedList.assignAll(result);
    deceasedList_masterList.assignAll(result);
  }

  Future<void> goToTheLocation(
      {required double lat,
      required double long,
      required String deceasedName}) async {
    // googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
    //     CameraPosition(
    //         bearing: 192.8334901395799,
    //         target: LatLng(lat, long),
    //         tilt: 59.440717697143555,
    //         zoom: 19.151926040649414)));
    LatLng deceasedLatlng = LatLng(lat, long);
    LatLng currentLatlng = LatLng(Get.find<LocationServices>().user_latitude,
        Get.find<LocationServices>().user_longitude);
    getCenter(
        currentLatlng: currentLatlng,
        deceasedLatlng: deceasedLatlng,
        deceasedName: deceasedName);
  }

  getCenter(
      {required LatLng currentLatlng,
      required LatLng deceasedLatlng,
      required String deceasedName}) {
    LatLngBounds bounds =
        LatLngBounds(southwest: LatLng(0, 0), northeast: LatLng(0, 0));
    if (deceasedLatlng.latitude > currentLatlng.latitude &&
        deceasedLatlng.longitude > currentLatlng.longitude) {
      bounds =
          LatLngBounds(southwest: currentLatlng, northeast: deceasedLatlng);
    } else if (deceasedLatlng.longitude > currentLatlng.longitude) {
      bounds = LatLngBounds(
          southwest: LatLng(deceasedLatlng.latitude, currentLatlng.longitude),
          northeast: LatLng(currentLatlng.latitude, deceasedLatlng.longitude));
    } else if (deceasedLatlng.latitude > currentLatlng.latitude) {
      bounds = LatLngBounds(
          southwest: LatLng(currentLatlng.latitude, deceasedLatlng.longitude),
          northeast: LatLng(deceasedLatlng.latitude, currentLatlng.longitude));
    } else {
      bounds =
          LatLngBounds(southwest: deceasedLatlng, northeast: currentLatlng);
    }

    // double center_lat =
    //     (bounds.southwest.latitude + bounds.northeast.latitude) / 2;
    // double center_long =
    //     (bounds.southwest.longitude + bounds.northeast.longitude) / 2;
    // LatLng centerOfTwoLocation = LatLng(center_lat, center_long);
    markers.clear();
    markers.add(Marker(
        markerId: MarkerId("deceasedID"),
        position: deceasedLatlng,
        infoWindow: InfoWindow(title: deceasedName)));
    markers.add(Marker(
        markerId: MarkerId("myLocation"),
        position: currentLatlng,
        infoWindow: InfoWindow(title: "Your current location")));

    googleMapController!
        .animateCamera(CameraUpdate.newLatLngBounds(bounds, 20.w));
  }

  searchDeceasedNew({required String word}) {
    deceasedList.assignAll(deceasedList_masterList
        .where((u) => (u.deceasedFullname
            .toString()
            .toLowerCase()
            .contains(word.toLowerCase())))
        .toList());
  }
}
