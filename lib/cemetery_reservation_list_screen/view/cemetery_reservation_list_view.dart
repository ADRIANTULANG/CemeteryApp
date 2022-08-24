import 'package:cemeteryapp/cemetery_reservation_list_screen/view/cemetery_reservation_details.dart';
import 'package:cemeteryapp/color_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/cemetery_reservation_list_controller.dart';

class CemeteryReservationListView
    extends GetView<CemeteryReservationListController> {
  const CemeteryReservationListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CemeteryReservationListController());
    return Scaffold(
      body: Container(
          width: 100.w,
          height: 100.h,
          alignment: Alignment.center,
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Lot Reservation",
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Expanded(
                child: Container(
                  child: Obx(
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
                        : controller.reservationList.length == 0
                            ? Center(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Container(
                                      height: 40.h,
                                      width: 100.w,
                                      child: Image.asset(
                                          'assets/images/gravestone.png'),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Text(
                                      "Sorry no reservation data.",
                                      style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              )
                            : ListView.builder(
                                itemCount: controller.reservationList.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: EdgeInsets.only(
                                        left: 5.w, right: 5.w, bottom: 2.h),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () async {
                                            controller.selectedReservation =
                                                await controller
                                                    .reservationList[index];

                                            controller.getDeceasedDocuments(
                                                deceasedID: controller
                                                    .reservationList[index]
                                                    .dcsId);
                                            Get.to(() =>
                                                CemeteryReservationDetails());
                                          },
                                          child: Container(
                                            height: 10.h,
                                            width: 70.w,
                                            padding: EdgeInsets.only(
                                                top: 1.w, left: 1.w),
                                            decoration: BoxDecoration(
                                                color: controller
                                                            .reservationList[
                                                                index]
                                                            .resStatus ==
                                                        "1"
                                                    ? AppColor.mainColors
                                                    : controller
                                                                .reservationList[
                                                                    index]
                                                                .resStatus ==
                                                            "2"
                                                        ? Colors.lightGreen
                                                        : Colors.redAccent,
                                                borderRadius: BorderRadius.only(
                                                    bottomRight:
                                                        Radius.circular(12),
                                                    topRight:
                                                        Radius.circular(12))),
                                            child: Column(
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Reservation ID: ",
                                                      style: TextStyle(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Text(
                                                      controller
                                                          .reservationList[
                                                              index]
                                                          .resId,
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Deceased Name: ",
                                                      style: TextStyle(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    Text(
                                                      controller
                                                              .reservationList[
                                                                  index]
                                                              .dcsFname
                                                              .capitalizeFirst
                                                              .toString() +
                                                          " " +
                                                          controller
                                                              .reservationList[
                                                                  index]
                                                              .dcsMname
                                                              .capitalizeFirst
                                                              .toString() +
                                                          " " +
                                                          controller
                                                              .reservationList[
                                                                  index]
                                                              .dcsLname
                                                              .capitalizeFirst
                                                              .toString(),
                                                      style: TextStyle(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Lot ID: ",
                                                      style: TextStyle(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    Text(
                                                      controller
                                                          .reservationList[
                                                              index]
                                                          .resLotId,
                                                      style: TextStyle(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                      "Lot Price: ",
                                                      style: TextStyle(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                    Text(
                                                      "P" +
                                                          controller
                                                              .reservationList[
                                                                  index]
                                                              .lotPrice,
                                                      style: TextStyle(
                                                          fontSize: 10.sp,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Container(
                                          height: 10.h,
                                          width: 15.w,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  await controller
                                                      .approvedReservation(
                                                          res_id: controller
                                                              .reservationList[
                                                                  index]
                                                              .resId,
                                                          lot_id: controller
                                                              .reservationList[
                                                                  index]
                                                              .resLotId,
                                                          dcs_id: controller
                                                              .reservationList[
                                                                  index]
                                                              .dcsId);
                                                },
                                                child: Icon(
                                                  Icons.done_all_rounded,
                                                  color: Colors.green,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  await controller
                                                      .deniedReservation(
                                                    res_id: controller
                                                        .reservationList[index]
                                                        .resId,
                                                  );
                                                },
                                                child: Icon(
                                                  Icons.block,
                                                  color: Colors.red,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
