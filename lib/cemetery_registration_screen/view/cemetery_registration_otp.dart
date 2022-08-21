import "package:flutter/material.dart";
import 'package:get/get.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sizer/sizer.dart';

import '../../color_class.dart';
import '../controller/cemetery_registration_controller.dart';

class CemeteryRegistrationOtp extends GetView<CemeteryRegistrationController> {
  const CemeteryRegistrationOtp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.center,
                child: Text(
                  "Please Enter OPT.",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )),
            SizedBox(
              height: 3.h,
            ),
            Container(
              alignment: Alignment.center,
              child: OtpTextField(
                numberOfFields: 6,
                borderColor: AppColor.mainColors,
                disabledBorderColor: Colors.black,
                enabledBorderColor: AppColor.mainColors,
                fillColor: AppColor.mainColors,
                showFieldAsBox: true,

                onCodeChanged: (String code) {},

                onSubmit: (String verificationCode) async {
                  PhoneAuthCredential phoneAuthCredential =
                      await PhoneAuthProvider.credential(
                          verificationId: controller.verifIDReceived,
                          smsCode: verificationCode);

                  controller.signInWithPhoneAuthCredential(
                      phoneAuthCredential, context);
                  // showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return AlertDialog(
                  //         title: Text("Verification Code"),
                  //         content: Text('Code entered is $verificationCode'),
                  //       );
                  //     });
                }, // end onSubmit
              ),
            )
          ],
        ),
      ),
    );
  }
}
