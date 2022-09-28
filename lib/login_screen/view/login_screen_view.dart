import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../color_class.dart';
import '../../frequently_ask_questions_screen/view/frequently_ask_questions_view.dart';
import '../controller/login_screen_controller.dart';
import '../dialog/login_screen_dialogs.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 15.h,
                  width: 100.w,
                  padding: EdgeInsets.only(right: 5.w, top: 2.h),
                  alignment: Alignment.topRight,
                  child: InkWell(
                      onTap: () {
                        Get.to(() => FrequestAskQuestionsView());
                      },
                      child: Icon(Icons.info_outline)),
                ),
                Image.asset('assets/images/logincemetery.png'),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  height: 8.h,
                  width: 100.w,
                  child: TextField(
                    controller: controller.username,
                    obscureText: false,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                      labelText: 'User name',
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  height: 8.h,
                  width: 100.w,
                  child: Obx(
                    () => TextField(
                      controller: controller.password,
                      obscureText: controller.isShowpassword.value,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        suffixIcon: InkWell(
                            onTap: () {
                              if (controller.isShowpassword.value == true) {
                                controller.isShowpassword.value = false;
                              } else {
                                controller.isShowpassword.value = true;
                              }
                            },
                            child: Obx(
                              () => Icon(
                                Icons.remove_red_eye,
                                color: controller.isShowpassword.value == true
                                    ? AppColor.mainColors
                                    : Colors.grey[400],
                              ),
                            )),
                        alignLabelWithHint: true,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15)),
                        labelText: 'Password',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Obx(
                  () => controller.isGettingCredentials.value == false
                      ? Padding(
                          padding: EdgeInsets.only(left: 5.w, right: 5.w),
                          child: InkWell(
                            onTap: () {
                              if (controller.username.text.isNotEmpty &&
                                  controller.password.text.isNotEmpty) {
                                controller.login(
                                    username: controller.username.text,
                                    password: controller.password.text);
                              } else {
                                Get.snackbar(
                                  "Message",
                                  "Oops, Missing Input",
                                  colorText: Colors.white,
                                  backgroundColor: Colors.lightGreen,
                                  snackPosition: SnackPosition.BOTTOM,
                                );
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
                                "LOGIN",
                                style: TextStyle(
                                  letterSpacing: 4,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        )
                      : Padding(
                          padding: EdgeInsets.only(left: 5.w, right: 5.w),
                          child: Container(
                            height: 8.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                                color: AppColor.mainColors,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(color: Colors.black54)),
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                ),
                SizedBox(
                  height: 2.5.h,
                ),
                Container(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 12.sp),
                      ),
                      SizedBox(
                        width: 1.5.w,
                      ),
                      InkWell(
                        onTap: () {
                          LoginDialogs.showDialog();
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 12.sp),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
