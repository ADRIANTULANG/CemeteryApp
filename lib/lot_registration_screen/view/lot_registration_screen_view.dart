import 'package:cemeteryapp/storage_services.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../../color_class.dart';
import '../controller/lot_registration_controller.dart';

class LotRegistrationView extends GetView<LotRegistrationController> {
  const LotRegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LotRegistrationController());
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 7.h,
              ),
              Text(
                "Lot Registration",
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Create a vacant lot for the cemetery",
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: .5,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: Container(
                  height: 40.h,
                  width: 100.w,
                  child: Obx(
                    () => GoogleMap(
                      zoomControlsEnabled: false,
                      mapType: MapType.hybrid,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                            double.parse(Get.find<StorageServices>()
                                .storage
                                .read("cmLatitude")),
                            double.parse(Get.find<StorageServices>()
                                .storage
                                .read("cmLongitude"))),
                        zoom: 18.4746,
                      ),
                      onTap: (LatLng location) {
                        controller.ontap_GoogleMap(
                            latitude: location.latitude,
                            longitude: location.longitude);
                      },
                      markers: Set<Marker>.of(controller.markers),
                      onMapCreated: (GoogleMapController googlemapcontroller) {
                        if (controller.mapcontroller.isCompleted == true) {
                          controller.mapcontroller
                              .complete(googlemapcontroller);
                        } else {}
                        controller.googleMapController = googlemapcontroller;
                      },
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                height: 6.h,
                width: 100.w,
                child: TextField(
                  controller: controller.lotprice,
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      labelText: 'Lot Price',
                      hintText: 'Enter Lot Price',
                      hintStyle: TextStyle(fontSize: 12.sp),
                      labelStyle: TextStyle(fontSize: 12.sp)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                height: 15.h,
                width: 100.w,
                child: TextField(
                  controller: controller.lotDescription,
                  obscureText: false,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 3.5.w, bottom: 0.h, top: 2.5.h, right: 0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      labelText: 'Lot Description',
                      hintText: 'Enter Lot Description',
                      alignLabelWithHint: true,
                      hintStyle: TextStyle(fontSize: 12.sp),
                      labelStyle: TextStyle(fontSize: 12.sp)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => controller.isCreating.value == false
                    ? Container(
                        width: 100.w,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 5.w, right: 5.w, bottom: 4.h),
                          child: InkWell(
                            onTap: () {
                              if (controller.lotprice.text.isEmpty ||
                                  controller.lotDescription.text.isEmpty) {
                                Get.snackbar(
                                  "Message",
                                  "Missing input",
                                  colorText: Colors.white,
                                  backgroundColor: AppColor.mainColors,
                                  snackPosition: SnackPosition.TOP,
                                );
                              } else if (controller.selected_lat == 0.0 ||
                                  controller.selected_long == 0.0) {
                                Get.snackbar(
                                  "Please select a location",
                                  "Tap on the map to select",
                                  colorText: Colors.white,
                                  backgroundColor: AppColor.mainColors,
                                  snackPosition: SnackPosition.TOP,
                                );
                              } else {
                                controller.createCemeteryLot();
                              }
                            },
                            child: Container(
                              height: 8.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  color: AppColor.mainColors,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.black54)),
                              alignment: Alignment.center,
                              child: Text(
                                "D O N E",
                                style: TextStyle(
                                  letterSpacing: 2,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        width: 100.w,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 5.w, right: 5.w, bottom: 4.h),
                          child: Container(
                            height: 8.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: AppColor.mainColors,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black54)),
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
