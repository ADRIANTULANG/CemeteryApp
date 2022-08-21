import 'package:cemeteryapp/color_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../cemetery_registration_screen/view/cemetery_registration_view.dart';
import '../../customer_registration_screen/view/customer_registration_view.dart';

class LoginDialogs {
  static showDialog() {
    Get.dialog(AlertDialog(
        contentPadding: EdgeInsets.all(2.w),
        content: Container(
          height: 25.h,
          width: 100.w,
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Please select account you want to create.",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  Get.to(() => CustomerRegistrationView());
                },
                child: Container(
                  height: 5.h,
                  width: 45.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColor.mainColors,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)),
                  child: Text(
                    "Customer",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: 2,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              InkWell(
                onTap: () {
                  Get.back();
                  Get.to(() => CemeteryRegistrationView());
                },
                child: Container(
                  height: 5.h,
                  width: 45.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColor.mainColors,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey)),
                  child: Text(
                    "Company",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        letterSpacing: 2,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.sp),
                  ),
                ),
              ),
            ],
          ),
        )));
  }
}
