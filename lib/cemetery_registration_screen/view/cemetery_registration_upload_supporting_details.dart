import 'dart:io';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../color_class.dart';
import '../controller/cemetery_registration_controller.dart';
import 'package:sizer/sizer.dart';

import 'cemetery_registration_google_maps.dart';

class CemeteryRegistrationUploadSupportDetails
    extends GetView<CemeteryRegistrationController> {
  const CemeteryRegistrationUploadSupportDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Upload Required Documents",
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 5.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w),
                width: 100.w,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Business Permit",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: Obx(
                  () => controller.listOfImage_businessPermit.length == 0
                      ? SizedBox()
                      : GridView.builder(
                          padding: EdgeInsets.only(top: 1.h),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                            crossAxisCount: 2,
                          ),
                          itemCount:
                              controller.listOfImage_businessPermit.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 10.h,
                              width: 85.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(File(controller
                                          .listOfImage_businessPermit[index]
                                          .imagePath))),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: Colors.black)),
                              alignment: Alignment.center,
                            );
                          },
                        ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.addImageCamera_bussinesPermit();
                      },
                      child: Container(
                        height: 7.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                            color: AppColor.mainColors,
                            borderRadius: BorderRadius.circular(12)),
                        alignment: Alignment.center,
                        child: Text(
                          "Camera",
                          style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    InkWell(
                      onTap: () {
                        controller.addImageGallery_bussinesPermit();
                      },
                      child: Container(
                        height: 7.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                            color: AppColor.mainColors,
                            borderRadius: BorderRadius.circular(12)),
                        alignment: Alignment.center,
                        child: Text(
                          "Gallery",
                          style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w),
                width: 100.w,
                alignment: Alignment.centerLeft,
                child: Text(
                  "DTI Permit",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: Obx(
                  () => controller.listOfImage_dti.length == 0
                      ? SizedBox()
                      : GridView.builder(
                          padding: EdgeInsets.only(top: 1.h),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                            crossAxisCount: 2,
                          ),
                          itemCount: controller.listOfImage_dti.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 10.h,
                              width: 85.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(File(controller
                                          .listOfImage_dti[index].imagePath))),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: Colors.black)),
                              alignment: Alignment.center,
                            );
                          },
                        ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.addImageCamera_dti();
                      },
                      child: Container(
                        height: 7.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                            color: AppColor.mainColors,
                            borderRadius: BorderRadius.circular(12)),
                        alignment: Alignment.center,
                        child: Text(
                          "Camera",
                          style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    InkWell(
                      onTap: () {
                        controller.addImageGallery_dti();
                      },
                      child: Container(
                        height: 7.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                            color: AppColor.mainColors,
                            borderRadius: BorderRadius.circular(12)),
                        alignment: Alignment.center,
                        child: Text(
                          "Gallery",
                          style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w),
                width: 100.w,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Certificate of Phgeps",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: Obx(
                  () => controller.listOfImage_certofPhgeps.length == 0
                      ? SizedBox()
                      : GridView.builder(
                          padding: EdgeInsets.only(top: 1.h),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                            crossAxisCount: 2,
                          ),
                          itemCount: controller.listOfImage_certofPhgeps.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 10.h,
                              width: 85.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(File(controller
                                          .listOfImage_certofPhgeps[index]
                                          .imagePath))),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: Colors.black)),
                              alignment: Alignment.center,
                            );
                          },
                        ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.addImageCamera_Certificate_of_Phgeps();
                      },
                      child: Container(
                        height: 7.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                            color: AppColor.mainColors,
                            borderRadius: BorderRadius.circular(12)),
                        alignment: Alignment.center,
                        child: Text(
                          "Camera",
                          style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    InkWell(
                      onTap: () {
                        controller.addImageGallery_Certificate_of_Phgeps();
                      },
                      child: Container(
                        height: 7.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                            color: AppColor.mainColors,
                            borderRadius: BorderRadius.circular(12)),
                        alignment: Alignment.center,
                        child: Text(
                          "Gallery",
                          style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w),
                width: 100.w,
                alignment: Alignment.centerLeft,
                child: Text(
                  "BIR Permit",
                  style:
                      TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                child: Obx(
                  () => controller.listOfImage_bir.length == 0
                      ? SizedBox()
                      : GridView.builder(
                          padding: EdgeInsets.only(top: 1.h),
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                            crossAxisCount: 2,
                          ),
                          itemCount: controller.listOfImage_bir.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 10.h,
                              width: 85.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(File(controller
                                          .listOfImage_bir[index].imagePath))),
                                  shape: BoxShape.rectangle,
                                  border: Border.all(color: Colors.black)),
                              alignment: Alignment.center,
                            );
                          },
                        ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 100.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        controller.addImageCamera_bir();
                      },
                      child: Container(
                        height: 7.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                            color: AppColor.mainColors,
                            borderRadius: BorderRadius.circular(12)),
                        alignment: Alignment.center,
                        child: Text(
                          "Camera",
                          style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    InkWell(
                      onTap: () {
                        controller.addImageGallery_bir();
                      },
                      child: Container(
                        height: 7.h,
                        width: 45.w,
                        decoration: BoxDecoration(
                            color: AppColor.mainColors,
                            borderRadius: BorderRadius.circular(12)),
                        alignment: Alignment.center,
                        child: Text(
                          "Gallery",
                          style: TextStyle(
                            letterSpacing: 2,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Obx(
                () => controller.listOfImage_businessPermit.length != 0 ||
                        controller.listOfImage_dti.length != 0 ||
                        controller.listOfImage_certofPhgeps.length != 0 ||
                        controller.listOfImage_bir.length != 0
                    ? InkWell(
                        onTap: () {
                          controller.listOfImage.clear();
                          controller.listOfImage
                              .addAll(controller.listOfImage_businessPermit);
                          controller.listOfImage
                              .addAll(controller.listOfImage_dti);
                          controller.listOfImage
                              .addAll(controller.listOfImage_certofPhgeps);
                          controller.listOfImage
                              .addAll(controller.listOfImage_bir);
                          print(controller.listOfImage.length);
                          Get.to(() => CemeteryRegistrationGoogleMaps());
                        },
                        child: Container(
                          height: 7.h,
                          width: 92.w,
                          decoration: BoxDecoration(
                              color: AppColor.mainColors,
                              borderRadius: BorderRadius.circular(12)),
                          alignment: Alignment.center,
                          child: Text(
                            "SUBMIT",
                            style: TextStyle(
                              letterSpacing: 2,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      )
                    : SizedBox(),
              ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
