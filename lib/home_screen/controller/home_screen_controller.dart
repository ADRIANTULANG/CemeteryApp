import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../api/home_screen_api.dart';
import '../model/home_screen_model.dart';

class HomeScreenController extends GetxController {
  Completer<GoogleMapController> mapcontroller = Completer();
  GoogleMapController? googleMapController;
  TextEditingController deceasedTextfield = TextEditingController();
  Timer? debounce;
  static final CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  RxList<CemeteryList> cemeteryList = <CemeteryList>[].obs;

  RxList<DeceasedModel> deceasedList = <DeceasedModel>[].obs;

  RxList<Marker> markers = <Marker>[].obs;

  @override
  void onInit() async {
    await getCemetery();
    getDeceased();

    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCemetery() async {
    var result = await HomeScreenApi.getCemetery();
    cemeteryList.assignAll(result);

    for (var i = 0; i < cemeteryList.length; i++) {
      markers.add(Marker(
          markerId: MarkerId(cemeteryList[i].id),
          position: LatLng(double.parse(cemeteryList[i].latitude),
              double.parse(cemeteryList[i].longitude)),
          infoWindow: InfoWindow(
              title: cemeteryList[i].name,
              snippet: cemeteryList[i].companyDescription)));
    }
  }

  getDeceased() async {
    var result = await HomeScreenApi.getDeceased();
    deceasedList.assignAll(result);
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

  searchDeceased({required String deceasedName}) async {
    var lat = 0.0;
    var long = 0.0;

    for (var i = 0; i < deceasedList.length; i++) {
      String fullName = deceasedList[i].dcsFname +
          " " +
          deceasedList[i].dcsMname +
          " " +
          deceasedList[i].dcsLname;

      if (deceasedName.trim().toLowerCase().toString() ==
          fullName.trim().toLowerCase().toString()) {
        lat = double.parse(deceasedList[i].lotLatitude);
        long = double.parse(deceasedList[i].lotLongitude);
      }
    }
    if (lat == 0.0 && long == 0.0) {
    } else {
      markers.add(Marker(
          markerId: MarkerId("$lat,$long"),
          position: LatLng(lat, long),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
          infoWindow: InfoWindow(
            title: "$deceasedName's location",
          )));

      await googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(
              bearing: 192.8334901395799,
              target: LatLng(lat, long),
              tilt: 59.440717697143555,
              zoom: 19.151926040649414)));
    }
    print(lat);
    print(long);
    deceasedTextfield.clear();
  }
}
