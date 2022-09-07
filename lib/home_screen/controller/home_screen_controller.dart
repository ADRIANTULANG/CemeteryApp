import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../location_services.dart';
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

  RxBool isLoading = true.obs;

  @override
  void onInit() async {
    await getCemetery();
    await getDeceased();
    isLoading(false);
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getCemetery() async {
    var result = await HomeScreenApi.getCemetery();
    cemeteryList.assignAll(result);

    // for (var i = 0; i < cemeteryList.length; i++) {
    //   markers.add(Marker(
    //       markerId: MarkerId(cemeteryList[i].id),
    //       position: LatLng(double.parse(cemeteryList[i].latitude),
    //           double.parse(cemeteryList[i].longitude)),
    //       infoWindow: InfoWindow(
    //           title: cemeteryList[i].name,
    //           snippet: cemeteryList[i].companyDescription)));
    // }
  }

  getDeceased() async {
    var result = await HomeScreenApi.getDeceased();
    deceasedList.assignAll(result);
  }

  Future<void> goToTheLocation(
      {required double lat,
      required double long,
      required String cemeteryName}) async {
    // googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
    //     CameraPosition(
    //         bearing: 192.8334901395799,
    //         target: LatLng(lat, long),
    //         tilt: 59.440717697143555,
    //         zoom: 19.151926040649414)));
    LatLng cemeteryLatlng = LatLng(lat, long);
    LatLng currentLatlng = LatLng(Get.find<LocationServices>().user_latitude,
        Get.find<LocationServices>().user_longitude);
    getCenter(
        currentLatlng: currentLatlng,
        cemeteryLatlng: cemeteryLatlng,
        cemeteryName: cemeteryName);
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

  getCenter(
      {required LatLng currentLatlng,
      required LatLng cemeteryLatlng,
      required String cemeteryName}) {
    LatLngBounds bounds =
        LatLngBounds(southwest: LatLng(0, 0), northeast: LatLng(0, 0));
    if (cemeteryLatlng.latitude > currentLatlng.latitude &&
        cemeteryLatlng.longitude > currentLatlng.longitude) {
      bounds =
          LatLngBounds(southwest: currentLatlng, northeast: cemeteryLatlng);
    } else if (cemeteryLatlng.longitude > currentLatlng.longitude) {
      bounds = LatLngBounds(
          southwest: LatLng(cemeteryLatlng.latitude, currentLatlng.longitude),
          northeast: LatLng(currentLatlng.latitude, cemeteryLatlng.longitude));
    } else if (cemeteryLatlng.latitude > currentLatlng.latitude) {
      bounds = LatLngBounds(
          southwest: LatLng(currentLatlng.latitude, cemeteryLatlng.longitude),
          northeast: LatLng(cemeteryLatlng.latitude, currentLatlng.longitude));
    } else {
      bounds =
          LatLngBounds(southwest: cemeteryLatlng, northeast: currentLatlng);
    }

    // double center_lat =
    //     (bounds.southwest.latitude + bounds.northeast.latitude) / 2;
    // double center_long =
    //     (bounds.southwest.longitude + bounds.northeast.longitude) / 2;
    // LatLng centerOfTwoLocation = LatLng(center_lat, center_long);
    markers.clear();
    markers.add(Marker(
        markerId: MarkerId("cemeteryID"),
        position: cemeteryLatlng,
        infoWindow: InfoWindow(title: cemeteryName)));
    markers.add(Marker(
        markerId: MarkerId("myLocation"),
        position: currentLatlng,
        infoWindow: InfoWindow(title: "Your current location")));

    googleMapController!
        .animateCamera(CameraUpdate.newLatLngBounds(bounds, 20.w));
  }
}
