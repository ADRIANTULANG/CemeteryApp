import 'package:cemeteryapp/color_class.dart';
import 'package:cemeteryapp/endPoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../cemetery_reservation_list_screen/view/cemetery_reservation_list_view.dart';
import '../../lot_registration_screen/view/lot_registration_screen_view.dart';
import '../../storage_services.dart';
import '../controller/home_screen_cemetery_controller.dart';
import '../dialog/home_screen_cemetery_dialog.dart';

class HomescreenCemeteryView extends GetView<HomeScreenCemeteryController> {
  const HomescreenCemeteryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenCemeteryController());
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: 40.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: AppColor.mainColors,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "${AppEndpoint.imageEndpoint}/${Get.find<StorageServices>().storage.read("cemImage")}"))),
                ),
                Positioned(
                    top: 10.h,
                    left: 2.w,
                    child: InkWell(
                      onTap: () {
                        Get.to(() => CemeteryReservationListView());
                      },
                      child: Container(
                        height: 7.h,
                        width: 7.h,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Icon(
                          Icons.list,
                          color: AppColor.mainColors,
                        ),
                      ),
                    )),
                Positioned(
                    top: 1.h,
                    left: 2.w,
                    child: InkWell(
                      onTap: () {
                        HomeScreenCemeteryDialog.showDialog();
                      },
                      child: Container(
                        height: 7.h,
                        width: 7.h,
                        decoration: BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Icon(
                          Icons.logout,
                          color: AppColor.mainColors,
                        ),
                      ),
                    )),
                Positioned(
                  bottom: 2.5.w,
                  left: 2.w,
                  right: 2.w,
                  child: Container(
                    height: 15.h,
                    width: 100.w,
                    padding: EdgeInsets.only(left: 2.w, top: 2.w),
                    decoration: BoxDecoration(
                        color: AppColor.mainColors,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Get.find<StorageServices>().storage.read("cmName"),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          Get.find<StorageServices>().storage.read("cmAddress"),
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 10.sp,
                          ),
                        ),
                        Text(
                          Get.find<StorageServices>().storage.read("cmEmail"),
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 10.sp,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Expanded(
                            child: Container(
                          child: Text(
                            Get.find<StorageServices>()
                                .storage
                                .read("cDescription"),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 8.sp,
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: Container(
                child: Obx(
                  () => controller.isLoading.value == true
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : controller.cemeteryLot.length == 0
                          ? Center(
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Container(
                                    height: 20.h,
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
                                    "Sorry no available data",
                                    style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              itemCount: controller.cemeteryLot.length,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: 5.w, right: 5.w, bottom: 2.h),
                                  child: Container(
                                    padding:
                                        EdgeInsets.only(left: 2.w, top: 2.w),
                                    height: 13.h,
                                    width: 100.w,
                                    decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 243, 245, 144),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Lot no. ",
                                              style: TextStyle(fontSize: 10.sp),
                                            ),
                                            Text(
                                              controller
                                                  .cemeteryLot[index].lotId,
                                              style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Price: ",
                                              style: TextStyle(fontSize: 10.sp),
                                            ),
                                            Text(
                                              "P " +
                                                  controller.cemeteryLot[index]
                                                      .lotPrice,
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.w500),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Status: ",
                                              style: TextStyle(fontSize: 10.sp),
                                            ),
                                            Text(
                                              controller.cemeteryLot[index]
                                                          .status ==
                                                      "1"
                                                  ? "Vacant"
                                                  : controller
                                                              .cemeteryLot[
                                                                  index]
                                                              .status ==
                                                          "2"
                                                      ? "Occupied"
                                                      : "Reserved",
                                              style: TextStyle(
                                                  color: controller
                                                              .cemeteryLot[
                                                                  index]
                                                              .status ==
                                                          "1"
                                                      ? Color.fromARGB(
                                                          255, 99, 182, 4)
                                                      : controller
                                                                  .cemeteryLot[
                                                                      index]
                                                                  .status ==
                                                              "2"
                                                          ? Color.fromARGB(
                                                              255, 87, 88, 86)
                                                          : Color.fromARGB(
                                                              255, 204, 20, 7),
                                                  fontSize: 10.sp,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Description: ",
                                              style: TextStyle(fontSize: 10.sp),
                                            ),
                                            Text(
                                              controller.cemeteryLot[index]
                                                  .lotDescription,
                                              style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight:
                                                      FontWeight.normal),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                ),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.to(() => LotRegistrationView());
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
