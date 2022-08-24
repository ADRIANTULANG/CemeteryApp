import 'package:cemeteryapp/endPoints.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../controller/cemetery_reservation_list_controller.dart';
import 'package:sizer/sizer.dart';

class CemeteryReservationDetails
    extends GetView<CemeteryReservationListController> {
  const CemeteryReservationDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Reservation Details",
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: 100.w,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Deceased Details",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp),
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Deceased Name",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      fontSize: 9.sp),
                ),
              ),
              SizedBox(
                height: .5.h,
              ),
              Container(
                height: 6.h,
                width: 100.w,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 2.5.w),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(
                  controller.selectedReservation!.dcsFname +
                      " " +
                      controller.selectedReservation!.dcsMname +
                      " " +
                      controller.selectedReservation!.dcsLname,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 0,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Deceased Address",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 0,
                      fontWeight: FontWeight.normal,
                      fontSize: 9.sp),
                ),
              ),
              SizedBox(
                height: .5.h,
              ),
              Container(
                height: 6.h,
                width: 100.w,
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 2.5.w),
                decoration:
                    BoxDecoration(border: Border.all(color: Colors.black)),
                child: Text(
                  controller.selectedReservation!.dcsAddress,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 0,
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 27.w,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Civil Status",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                fontSize: 9.sp),
                          ),
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                        Container(
                          height: 6.h,
                          width: 27.w,
                          padding: EdgeInsets.only(left: 2.5.w),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Text(
                            controller.selectedReservation!.dcsCivilStatus,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                letterSpacing: 0,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 27.w,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Gender",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                fontSize: 9.sp),
                          ),
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                        Container(
                          height: 6.h,
                          width: 27.w,
                          padding: EdgeInsets.only(left: 2.5.w),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Text(
                            controller.selectedReservation!.dcsGender,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                letterSpacing: 0,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 27.w,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Age",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                fontSize: 9.sp),
                          ),
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                        Container(
                          height: 6.h,
                          width: 27.w,
                          padding: EdgeInsets.only(left: 2.5.w),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Text(
                            controller.selectedReservation!.dcsAge,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                letterSpacing: 0,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 27.w,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Date of Birth",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                fontSize: 9.sp),
                          ),
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                        Container(
                          height: 6.h,
                          width: 27.w,
                          padding: EdgeInsets.only(left: 2.5.w),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Text(
                            DateFormat.yMd().format(
                                controller.selectedReservation!.dcsDoBirth),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                letterSpacing: 0,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 27.w,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Date Died",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                fontSize: 9.sp),
                          ),
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                        Container(
                          height: 6.h,
                          width: 27.w,
                          padding: EdgeInsets.only(left: 2.5.w),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Text(
                            DateFormat.yMd().format(
                                controller.selectedReservation!.dcsDoDeath),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                letterSpacing: 0,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Column(
                      children: [
                        Container(
                          width: 27.w,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Burial Schedule",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                letterSpacing: 0,
                                fontWeight: FontWeight.normal,
                                fontSize: 9.sp),
                          ),
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                        Container(
                          height: 6.h,
                          width: 27.w,
                          padding: EdgeInsets.only(left: 2.5.w),
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black)),
                          child: Text(
                            DateFormat.yMd().format(
                                controller.selectedReservation!.schedOfBurial),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                letterSpacing: 0,
                                fontWeight: FontWeight.w400,
                                fontSize: 13.sp),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                width: 100.w,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Reservation Documents",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      letterSpacing: 2,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp),
                ),
              ),
              Container(
                child: Obx(
                  () => GridView.builder(
                    padding: EdgeInsets.only(top: 2.h, bottom: 2.h),
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10),
                    itemCount: controller.deceasedDocuments.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 15.h,
                        width: 30.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "${AppEndpoint.imageEndpoint}/${controller.deceasedDocuments[index].ddImage}"))),
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
