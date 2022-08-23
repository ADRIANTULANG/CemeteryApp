import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../color_class.dart';
import '../../deceased_filling_screen/view/deceased_filling_view.dart';
import '../controller/cemetery_details_screen_controller.dart';

class CemeteryDetailsView extends GetView<CemeteryDetailsController> {
  const CemeteryDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CemeteryDetailsController());
    return Scaffold(
      body: Obx(
        () => controller.isLoading.value == true
            ? Container(
                height: 100.h,
                width: 100.w,
                child: Center(
                  child: SpinKitPouringHourGlassRefined(
                    color: AppColor.mainColors,
                    size: 100.sp,
                  ),
                ),
              )
            : Container(
                height: 100.h,
                width: 100.w,
                child: Column(
                  children: [
                    Container(
                      height: 35.h,
                      width: 100.w,
                      child: Obx(
                        () => controller.store_Latitude.value != 0.0
                            ? GoogleMap(
                                mapType: MapType.hybrid,
                                initialCameraPosition: CameraPosition(
                                  target: LatLng(
                                      controller.store_Latitude.value,
                                      controller.store_Longitude.value),
                                  zoom: 17.4746,
                                ),
                                markers:
                                    Set<Marker>.of(controller.cemetery_markers),
                                onMapCreated:
                                    (GoogleMapController googlemapcontroller) {
                                  if (!controller
                                      .cemetery_mapcontroller.isCompleted) {
                                    controller.cemetery_mapcontroller
                                        .complete(googlemapcontroller);
                                  }
                                  controller.googleMapController =
                                      googlemapcontroller;
                                },
                              )
                            : SizedBox(),
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.only(left: 2.w, right: 2.w, bottom: 2.h),
                      width: 100.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Obx(
                            () => Text(
                              controller.cemeteryName.value,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16.sp),
                            ),
                          ),
                          Obx(
                            () => Text(
                              controller.cemeteryAddress.value,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10.sp),
                            ),
                          ),
                          Obx(
                            () => Text(
                              controller.cemeteryContactNumber.value,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 10.sp),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: Obx(
                        () => controller.lotList.length == 0
                            ? Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 25.h,
                                      width: 100.w,
                                      child: Image.asset(
                                          'assets/images/gravestone.png'),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      "Oops!",
                                      style: TextStyle(
                                          fontSize: 17.sp,
                                          letterSpacing: 2,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "Sorry no available Reservation",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.only(top: 1.h),
                                itemCount: controller.lotList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: 2.w, right: 2.w, bottom: 2.h),
                                    child: Container(
                                      height: 15.h,
                                      width: 100.w,
                                      padding: EdgeInsets.only(
                                          left: 2.w, right: 2.w, top: 2.w),
                                      color: Color.fromARGB(255, 243, 242, 226),
                                      child: Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Get.to(
                                                  () => DeceasedFillingView(),
                                                  arguments: {
                                                    "cemeteryID": controller
                                                        .cemeteryID.value,
                                                    "lotid": controller
                                                        .lotList[index].lotId
                                                  });
                                            },
                                            child: Container(
                                              width: 70.w,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "LOT#: " +
                                                        controller
                                                            .lotList[index]
                                                            .lotId,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 11.sp),
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Text(
                                                    "P " +
                                                        controller
                                                            .lotList[index]
                                                            .lotPrice
                                                            .toString(),
                                                    style: TextStyle(
                                                        // color: AppColor.mainColors,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15.sp),
                                                  ),
                                                  SizedBox(
                                                    height: .5.h,
                                                  ),
                                                  Text(
                                                    controller.lotList[index]
                                                        .lotDescription,
                                                    maxLines: 5,
                                                    style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 10.sp),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Container(
                                              alignment: Alignment.center,
                                              child: Column(
                                                children: [
                                                  IconButton(
                                                    onPressed: () {
                                                      controller.goToTheLocation(
                                                          lat: double.parse(
                                                              controller
                                                                  .lotList[
                                                                      index]
                                                                  .lotLatitude),
                                                          long: double.parse(
                                                              controller
                                                                  .lotList[
                                                                      index]
                                                                  .lotLongitude));
                                                    },
                                                    icon: Icon(
                                                      Icons.location_on,
                                                      size: 25.sp,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                  IconButton(
                                                    onPressed: () {
                                                      controller.makePhoneCall(
                                                          phoneNumber: controller
                                                              .cemeteryContactNumber
                                                              .value);
                                                    },
                                                    icon: Icon(
                                                      Icons.call,
                                                      size: 25.sp,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
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
      ),
    );
  }
}
