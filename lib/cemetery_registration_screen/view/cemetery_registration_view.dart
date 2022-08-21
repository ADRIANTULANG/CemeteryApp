import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../color_class.dart';
import '../controller/cemetery_registration_controller.dart';
import 'cemetery_registration_uploadLogo.dart';

class CemeteryRegistrationView extends GetView<CemeteryRegistrationController> {
  const CemeteryRegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CemeteryRegistrationController());
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Company Registration",
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Create an Account as Cemetery Company",
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: .5,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                height: 6.h,
                width: 100.w,
                child: TextField(
                  controller: controller.companyName,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      labelText: 'Company Name',
                      hintText: 'Enter Company Name',
                      hintStyle: TextStyle(fontSize: 12.sp),
                      labelStyle: TextStyle(fontSize: 12.sp)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                height: 6.h,
                width: 100.w,
                child: TextField(
                  obscureText: false,
                  controller: controller.contanctNo,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    if (controller.contanctNo.text.length == 0) {
                    } else {
                      if (controller.contanctNo.text[0] != "9" ||
                          controller.contanctNo.text.length > 10) {
                        controller.contanctNo.clear();
                      } else {}
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      labelText: 'Company Contact Number',
                      hintText: 'Enter Company Contact Number',
                      hintStyle: TextStyle(fontSize: 12.sp),
                      labelStyle: TextStyle(fontSize: 12.sp)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                height: 6.h,
                width: 100.w,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: controller.email,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      labelText: 'Company Email Address',
                      hintText: 'Enter Company Email Address',
                      hintStyle: TextStyle(fontSize: 12.sp),
                      labelStyle: TextStyle(fontSize: 12.sp)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                height: 6.h,
                width: 100.w,
                child: TextField(
                  controller: controller.address,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      labelText: 'Company Address',
                      hintText: 'Enter Company Address',
                      hintStyle: TextStyle(fontSize: 12.sp),
                      labelStyle: TextStyle(fontSize: 12.sp)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                height: 6.h,
                width: 100.w,
                child: TextField(
                  obscureText: false,
                  controller: controller.username,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      labelText: 'Company User Name',
                      hintText: 'Enter Company User Name',
                      hintStyle: TextStyle(fontSize: 12.sp),
                      labelStyle: TextStyle(fontSize: 12.sp)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                height: 6.h,
                width: 100.w,
                child: TextField(
                  obscureText: false,
                  controller: controller.password,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      labelText: 'Company Password',
                      hintText: 'Enter Company Password',
                      hintStyle: TextStyle(fontSize: 12.sp),
                      labelStyle: TextStyle(fontSize: 12.sp)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                height: 6.h,
                width: 100.w,
                child: TextField(
                  obscureText: false,
                  controller: controller.confirmpassword,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      labelText: 'Confirm Company Password',
                      hintText: 'Confirm Company Password',
                      hintStyle: TextStyle(fontSize: 12.sp),
                      labelStyle: TextStyle(fontSize: 12.sp)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                height: 15.h,
                width: 100.w,
                child: TextField(
                  obscureText: false,
                  controller: controller.description,
                  maxLines: 4,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 3.5.w, bottom: 0.h, top: 2.5.h, right: 0),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      labelText: 'Company Description',
                      hintText: 'Enter Company Description',
                      alignLabelWithHint: true,
                      hintStyle: TextStyle(fontSize: 12.sp),
                      labelStyle: TextStyle(fontSize: 12.sp)),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: 100.w,
                child: Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 4.h),
                  child: InkWell(
                    onTap: () {
                      if (controller.companyName.text.isEmpty ||
                          controller.contanctNo.text.isEmpty ||
                          controller.description.text.isEmpty ||
                          controller.email.text.isEmpty ||
                          controller.address.text.isEmpty ||
                          controller.username.text.isEmpty ||
                          controller.password.text.isEmpty ||
                          controller.confirmpassword.text.isEmpty) {
                        Get.snackbar(
                          "Message",
                          "Missing input",
                          colorText: Colors.white,
                          backgroundColor: Colors.red,
                          snackPosition: SnackPosition.TOP,
                        );
                      } else if (controller.contanctNo.text.length != 10) {
                        Get.snackbar(
                          "Message",
                          "Contact number must start with 9 and should be 10 digit number",
                          colorText: Colors.white,
                          backgroundColor: Colors.red,
                          snackPosition: SnackPosition.TOP,
                        );
                      } else if (controller.email.text.isEmail == false) {
                        Get.snackbar(
                          "Message",
                          "${controller.email.text} is not an email address",
                          colorText: Colors.white,
                          backgroundColor: Colors.red,
                          snackPosition: SnackPosition.TOP,
                        );
                      } else if (controller.password.text !=
                          controller.confirmpassword.text) {
                        Get.snackbar(
                          "Message",
                          "Password not match",
                          colorText: Colors.white,
                          backgroundColor: Colors.red,
                          snackPosition: SnackPosition.TOP,
                        );
                      } else {
                        Get.to(() => CemeteryRegistrationUploadLogo());
                      }
                    },
                    child: Container(
                      height: 8.h,
                      width: 100.w,
                      decoration: BoxDecoration(
                          color: AppColor.mainColors,
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Colors.black54)),
                      alignment: Alignment.center,
                      child: Text(
                        "NEXT",
                        style: TextStyle(
                          letterSpacing: 2,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
