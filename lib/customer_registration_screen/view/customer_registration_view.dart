import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../color_class.dart';
import '../controller/customer_registration_controller.dart';

class CustomerRegistrationView extends GetView<CustomerRegistrationController> {
  const CustomerRegistrationView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CustomerRegistrationController());
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 7.h,
              ),
              Text(
                "Sign Up",
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "Create an Account as Customer for free",
                textAlign: TextAlign.center,
                style: TextStyle(
                    letterSpacing: .5,
                    fontWeight: FontWeight.bold,
                    fontSize: 12.sp),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
                height: 6.h,
                width: 100.w,
                child: TextField(
                  controller: controller.firstname,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      labelText: 'First Name',
                      hintText: 'Enter First Name',
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
                  controller: controller.middle,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      labelText: 'Midle Name',
                      hintText: 'Enter Midle Name',
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
                  controller: controller.lastname,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      labelText: 'Last Name',
                      hintText: 'Enter Last Name',
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
                  controller: controller.contactnumber,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    if (controller.contactnumber.text.length == 0) {
                    } else {
                      if (controller.contactnumber.text[0] != "9" ||
                          controller.contactnumber.text.length > 10) {
                        controller.contactnumber.clear();
                      } else {}
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      labelText: 'Contact No.',
                      hintText: 'Enter Contact No.',
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
                  controller: controller.emailAddress,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      labelText: 'Email Address',
                      hintText: 'Enter Email Address',
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
                  controller: controller.username,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      labelText: 'User Name',
                      hintText: 'Enter User Name',
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
                      labelText: 'Password',
                      hintText: 'Enter Password',
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
                  controller: controller.confirmPassword,
                  obscureText: false,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)),
                      labelText: 'Confirm Password',
                      hintText: 'Enter Confirm Password',
                      hintStyle: TextStyle(fontSize: 12.sp),
                      labelStyle: TextStyle(fontSize: 12.sp)),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: 100.w,
        child: Padding(
          padding: EdgeInsets.only(left: 5.w, right: 5.w, bottom: 4.h),
          child: InkWell(
            onTap: () {
              if (controller.firstname.text.isEmpty ||
                  controller.lastname.text.isEmpty ||
                  controller.middle.text.isEmpty ||
                  controller.emailAddress.text.isEmpty ||
                  controller.username.text.isEmpty ||
                  controller.password.text.isEmpty ||
                  controller.confirmPassword.text.isEmpty) {
                Get.snackbar(
                  "Message",
                  "Missing input",
                  colorText: Colors.white,
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.TOP,
                );
              } else if (controller.contactnumber.text.length != 10) {
                Get.snackbar(
                  "Message",
                  "Contact number must start with 9 and should be 10 digit number",
                  colorText: Colors.white,
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.TOP,
                );
              } else if (controller.emailAddress.text.isEmail == false) {
                Get.snackbar(
                  "Message",
                  "${controller.emailAddress.text} is not an email address",
                  colorText: Colors.white,
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.TOP,
                );
              } else if (controller.confirmPassword.text !=
                  controller.password.text) {
                Get.snackbar(
                  "Message",
                  "Password not match",
                  colorText: Colors.white,
                  backgroundColor: Colors.red,
                  snackPosition: SnackPosition.TOP,
                );
              } else {
                controller.checkIfEmailAddressExist();
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
    );
  }
}
