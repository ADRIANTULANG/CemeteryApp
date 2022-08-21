import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/splas_screen_controller.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends GetView<SpashScreenController> {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SpashScreenController());
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(left: 3.w, right: 3.w),
        child: Center(
          child: Image.asset('assets/images/cemeterytrans.png'),
        ),
      ),
    );
  }
}
