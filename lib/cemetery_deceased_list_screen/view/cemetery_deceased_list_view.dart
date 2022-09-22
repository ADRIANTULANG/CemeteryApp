import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../../location_services.dart';
import '../controller/cemetery_deceased_list_controller.dart';

class CemeteryDeceasedListView extends GetView<CemeteryDeceasedListControler> {
  const CemeteryDeceasedListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CemeteryDeceasedListControler());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: 100.h,
        width: 100.w,
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            Obx(
              () => GoogleMap(
                mapType: MapType.hybrid,
                initialCameraPosition: CameraPosition(
                  target: LatLng(Get.find<LocationServices>().user_latitude,
                      Get.find<LocationServices>().user_longitude),
                  zoom: 14.4746,
                ),
                markers: Set<Marker>.of(controller.markers),
                onMapCreated: (GoogleMapController googlemapcontroller) {
                  if (!controller.mapcontroller.isCompleted) {
                    controller.mapcontroller.complete(googlemapcontroller);
                  }
                  controller.googleMapController = googlemapcontroller;
                },
              ),
            ),
            Positioned(
              bottom: 85.h,
              child: Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                height: 8.h,
                width: 100.w,
                child: TextField(
                  obscureText: false,
                  controller: controller.deceasedTextfield,
                  onChanged: (value) {
                    if (controller.debounce?.isActive ?? false)
                      controller.debounce!.cancel();
                    controller.debounce =
                        Timer(const Duration(milliseconds: 1000), () async {
                      FocusScope.of(context).unfocus();
                      if (controller.deceasedTextfield.text.trim().toString() ==
                          "") {
                        controller.deceasedList
                            .assignAll(controller.deceasedList_masterList);
                      } else {
                        await controller.searchDeceasedNew(
                            word: controller.deceasedTextfield.text);
                      }
                      FocusScope.of(context).unfocus();
                    });
                  },
                  decoration: InputDecoration(
                    suffixIcon: InkWell(
                      onTap: () {
                        controller.deceasedList
                            .assignAll(controller.deceasedList_masterList);
                        controller.deceasedTextfield.clear();
                        FocusScope.of(context).unfocus();
                      },
                      child: Icon(
                        Icons.clear,
                        color: Colors.red,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                    hintText: 'Enter Deceased Name',
                  ),
                ),
              ),
            ),
            Positioned(
                child: Container(
              height: 16.h,
              width: 100.w,
              child: Obx(
                () => ListView.builder(
                  itemCount: controller.deceasedList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding:
                          EdgeInsets.only(left: 2.w, top: 2.h, bottom: 1.h),
                      child: InkWell(
                        onTap: () {
                          controller.goToTheLocation(
                              lat: double.parse(
                                  controller.deceasedList[index].lotLatitude),
                              long: double.parse(
                                  controller.deceasedList[index].lotLongitude),
                              deceasedName: controller
                                  .deceasedList[index].deceasedFullname);
                        },
                        child: Container(
                          height: 15.h,
                          width: 60.w,
                          padding: EdgeInsets.only(left: 1.w, top: .5.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.deceasedList[index].deceasedFullname,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2,
                                    fontSize: 12.sp),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Text(
                                "Born: ${DateFormat.yMMMMd().format(controller.deceasedList[index].dcsDoBirth)}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2,
                                    fontSize: 9.sp),
                              ),
                              Text(
                                "Died: ${DateFormat.yMMMMd().format(controller.deceasedList[index].dcsDoDeath)}",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2,
                                    fontSize: 9.sp),
                              ),
                              Text(
                                "Age: ${controller.deceasedList[index].dcsAge} year/s old.",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2,
                                    fontSize: 9.sp),
                              ),
                              Text(
                                controller.deceasedList[index].dcsAddress,
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 2,
                                    fontSize: 9.sp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
