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
                "Upload Business Permits & more..",
                style: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
              ),
              Container(
                padding: EdgeInsets.only(left: 3.w, right: 3.w),
                child: Obx(
                  () => controller.listOfImage.length == 0
                      ? SizedBox()
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 1,
                            crossAxisCount: 2,
                          ),
                          itemCount: controller.listOfImage.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              height: 10.h,
                              width: 85.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: FileImage(File(controller
                                          .listOfImage[index].imagePath))),
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
                        controller.addImageCamera();
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
                        controller.addImageGallery();
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
                () => controller.listOfImage.length != 0
                    ? InkWell(
                        onTap: () {
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
