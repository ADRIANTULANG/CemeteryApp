import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:cemeteryapp/cemetery_details_screen/view/cemetery_details_screen_view.dart';
import 'package:cemeteryapp/endPoints.dart';
import 'package:cemeteryapp/storage_services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';
import '../../color_class.dart';
import '../../frequently_ask_questions_screen/view/frequently_ask_questions_view.dart';
import '../../location_services.dart';
import '../../reservation_booking_screen/view/reservation_booking_view.dart';
import '../controller/home_screen_controller.dart';
import '../dialog/home_screen_dialog.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
          child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: AppColor.mainColors,
            ),
            child: Column(
              children: [
                Container(
                  height: 10.h,
                  width: 40.w,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      color: AppColor.mainColors,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "${AppEndpoint.imageEndpoint}/${Get.find<StorageServices>().storage.read('clientImage')}"))),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Text(
                  "${Get.find<StorageServices>().storage.read('clientFirstName')} ${Get.find<StorageServices>().storage.read('clientMiddlename')} ${Get.find<StorageServices>().storage.read('clientLastname')}",
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
                ),
                Text(
                  "${Get.find<StorageServices>().storage.read('email')}",
                  style:
                      TextStyle(fontWeight: FontWeight.normal, fontSize: 10.sp),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Get.to(() => ReservationBookingView());
            },
            leading: Icon(Icons.list),
            title: Text('Bookings'),
          ),
          ListTile(
            onTap: () {
              Get.to(() => FrequestAskQuestionsView());
            },
            leading: Icon(Icons.info),
            title: Text('FAQ'),
          ),
          ListTile(
            onTap: () {
              Get.back();
              HomeScreenDialog.showDialog();
            },
            leading: Icon(Icons.logout),
            title: Text('Log out'),
          ),
        ],
      )),
      body: Obx(
        () => controller.isLoading.value == true
            ? Container(
                height: 100.h,
                width: 100.w,
                child: SpinKitPouringHourGlassRefined(
                  color: AppColor.mainColors,
                  size: 100.sp,
                ),
              )
            : controller.cemeteryList.length == 0
                ? Container(
                    height: 100.h,
                    width: 100.w,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 40.h,
                            width: 100.w,
                            child: Image.asset('assets/images/gravestone.png'),
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
                            "Sorry no available Cemetery",
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  )
                : WillPopScope(
                    onWillPop: (() => HomeScreenDialog.showDialog()),
                    child: Stack(
                      alignment: AlignmentDirectional.bottomStart,
                      children: [
                        Obx(
                          () => GoogleMap(
                            mapType: MapType.hybrid,
                            initialCameraPosition: CameraPosition(
                              target: LatLng(
                                  Get.find<LocationServices>().user_latitude,
                                  Get.find<LocationServices>().user_longitude),
                              zoom: 14.4746,
                            ),
                            markers: Set<Marker>.of(controller.markers),
                            onMapCreated:
                                (GoogleMapController googlemapcontroller) {
                              if (!controller.mapcontroller.isCompleted) {
                                controller.mapcontroller
                                    .complete(googlemapcontroller);
                              }
                              controller.googleMapController =
                                  googlemapcontroller;
                            },
                          ),
                        ),
                        Positioned(
                          bottom: 85.h,
                          left: 13.w,
                          child: Container(
                            padding: EdgeInsets.only(left: 5.w, right: 5.w),
                            height: 8.h,
                            width: 90.w,
                            child: TextField(
                              obscureText: false,
                              controller: controller.deceasedTextfield,
                              onChanged: (value) {
                                if (controller.debounce?.isActive ?? false)
                                  controller.debounce!.cancel();
                                controller.debounce =
                                    Timer(const Duration(milliseconds: 1000),
                                        () async {
                                  FocusScope.of(context).unfocus();
                                  if (controller.deceasedTextfield.text
                                          .trim()
                                          .toString() ==
                                      "") {
                                  } else {
                                    await controller.searchDeceased(
                                        deceasedName:
                                            controller.deceasedTextfield.text);
                                  }
                                  FocusScope.of(context).unfocus();
                                });
                              },
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                labelText: 'Search Deceased Name',
                                hintText: 'Enter Deceased Name',
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            bottom: 82.5.h,
                            left: 2.w,
                            child: Container(
                              height: 13.h,
                              width: 13.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Builder(
                                builder: (context) => IconButton(
                                    icon: Icon(
                                      Icons.person,
                                      color: AppColor.mainColors,
                                    ),
                                    onPressed: () {
                                      Scaffold.of(context).openDrawer();
                                      FocusScope.of(context).unfocus();
                                    }),
                              ),
                            )),
                        Container(
                          height: 25.h,
                          width: 100.w,
                          child: Obx(
                            () => ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: controller.cemeteryList.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      right: 2.w, left: 2.w, bottom: 3.h),
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(() => CemeteryDetailsView(),
                                          arguments: {
                                            "cemeteryID": controller
                                                .cemeteryList[index].id,
                                            "storeLatitude": double.parse(
                                                controller.cemeteryList[index]
                                                    .latitude),
                                            "storeLongitude": double.parse(
                                                controller.cemeteryList[index]
                                                    .longitude),
                                            "cemeteryName": controller
                                                .cemeteryList[index].name,
                                            "cemeteryContactNumber": controller
                                                .cemeteryList[index]
                                                .contactNumber
                                                .toString(),
                                            "cemeteryAddress": controller
                                                .cemeteryList[index].address
                                          });
                                    },
                                    child: Container(
                                      height: 23.h,
                                      width: 80.w,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: Colors.grey)),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 1.5.w,
                                          ),
                                          controller.cemeteryList[index]
                                                      .image !=
                                                  ""
                                              ? Container(
                                                  height: 20.h,
                                                  width: 35.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(5),
                                                        bottomLeft:
                                                            Radius.circular(5),
                                                      ),
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                              "${AppEndpoint.imageEndpoint}/${controller.cemeteryList[index].image}")),
                                                      border: Border.all(
                                                          color: Colors.black)),
                                                )
                                              : Container(
                                                  height: 20.h,
                                                  width: 35.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(5),
                                                        bottomLeft:
                                                            Radius.circular(5),
                                                      ),
                                                      image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: NetworkImage(
                                                              "${AppEndpoint.imageEndpoint}/logo-grave.png")),
                                                      border: Border.all(
                                                          color: Colors.black)),
                                                ),
                                          SizedBox(
                                            width: 1.5.w,
                                          ),
                                          Container(
                                            height: 20.h,
                                            width: 40.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  controller
                                                      .cemeteryList[index].name,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 13.sp),
                                                ),
                                                SizedBox(
                                                  height: .5.h,
                                                ),
                                                Text(
                                                  controller.cemeteryList[index]
                                                      .address,
                                                  style: TextStyle(
                                                      color: Colors.grey[500],
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 8.sp),
                                                ),
                                                Text(
                                                  controller.cemeteryList[index]
                                                      .contactNumber
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.grey[500],
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 8.sp),
                                                ),
                                                SizedBox(
                                                  height: .5.h,
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    controller
                                                        .cemeteryList[index]
                                                        .companyDescription
                                                        .toString(),
                                                    maxLines: 3,
                                                    style: TextStyle(
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color: Colors.grey[500],
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 8.sp),
                                                  ),
                                                ),
                                                Container(
                                                  height: 6.h,
                                                  width: 40.w,
                                                  child: Row(
                                                    // mainAxisAlignment:
                                                    //     MainAxisAlignment.spaceEvenly,
                                                    children: [
                                                      IconButton(
                                                          onPressed: () {
                                                            controller.makePhoneCall(
                                                                phoneNumber: controller
                                                                    .cemeteryList[
                                                                        index]
                                                                    .contactNumber
                                                                    .toString());
                                                          },
                                                          icon: Icon(
                                                            Icons.call,
                                                            color: Colors
                                                                .lightGreen,
                                                          )),
                                                      SizedBox(
                                                        width: 2.w,
                                                      ),
                                                      IconButton(
                                                          onPressed: () {
                                                            controller.goToTheLocation(
                                                                lat: double.parse(
                                                                    controller
                                                                        .cemeteryList[
                                                                            index]
                                                                        .latitude),
                                                                long: double.parse(controller
                                                                    .cemeteryList[
                                                                        index]
                                                                    .longitude));
                                                          },
                                                          icon: Icon(
                                                            Icons.location_on,
                                                            color: Colors.red,
                                                          ))
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
      ),
    );
  }
}
