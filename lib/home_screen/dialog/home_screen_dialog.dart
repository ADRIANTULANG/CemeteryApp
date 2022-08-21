import 'package:cemeteryapp/login_screen/view/login_screen_view.dart';
import 'package:cemeteryapp/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../color_class.dart';

class HomeScreenDialog {
  static showDialog() {
    Get.dialog(AlertDialog(
        contentPadding: EdgeInsets.all(2.w),
        content: Container(
          height: 22.h,
          width: 100.w,
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Do you want to exit?",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              InkWell(
                onTap: () async {
                  await Get.find<StorageServices>().removeStorageCredentials();
                  Get.offAll(() => LoginScreen());
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
                    "Yes",
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
                    "No",
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
