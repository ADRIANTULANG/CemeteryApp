import 'package:cemeteryapp/color_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../controller/reservation_booking_controller.dart';

class ReservationBookingView extends GetView<ReservationBookingController> {
  const ReservationBookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ReservationBookingController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 250, 239, 140),
        title: Text("Reservations"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(top: 3.h),
        child: Obx(
          () => controller.isloading.value == true
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
                              child:
                                  Image.asset('assets/images/gravestone.png'),
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
                                  fontSize: 14.sp, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      shrinkWrap: true,
                      itemCount: controller.reservationList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: 5.w, right: 5.w, bottom: 2.h),
                          child: Container(
                            padding: EdgeInsets.only(left: 2.w, top: 2.w),
                            height: 12.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 247, 177),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      "Reservation No. ",
                                      style: TextStyle(fontSize: 10.sp),
                                    ),
                                    Text(
                                      "${controller.reservationList[index].resId}",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Deceased Name:  ",
                                      style: TextStyle(fontSize: 10.sp),
                                    ),
                                    Text(
                                      "${controller.reservationList[index].dcsFname} ${controller.reservationList[index].dcsMname} ${controller.reservationList[index].dcsLname}",
                                      style: TextStyle(
                                          fontSize: 12.sp,
                                          fontWeight: FontWeight.w600),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "Cemetery: ",
                                      style: TextStyle(fontSize: 10.sp),
                                    ),
                                    Text(
                                      "${controller.reservationList[index].cmName}",
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400),
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
                                      "P ${controller.reservationList[index].lotPrice}",
                                      style: TextStyle(
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400),
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
                                      controller.reservationList[index]
                                                  .resStatus ==
                                              "1"
                                          ? "Pending"
                                          : controller.reservationList[index]
                                                      .resStatus ==
                                                  "2"
                                              ? "Approved"
                                              : "Denied",
                                      style: TextStyle(
                                          color: controller
                                                      .reservationList[index]
                                                      .resStatus ==
                                                  "1"
                                              ? Color.fromARGB(
                                                  255, 206, 206, 206)
                                              : controller
                                                          .reservationList[
                                                              index]
                                                          .resStatus ==
                                                      "2"
                                                  ? Color.fromARGB(
                                                      255, 7, 243, 15)
                                                  : Color.fromARGB(
                                                      255, 247, 15, 15),
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w400),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
        ),
      ),
    );
  }
}
