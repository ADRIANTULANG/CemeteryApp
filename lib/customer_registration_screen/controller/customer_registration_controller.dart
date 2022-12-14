import 'package:cemeteryapp/customer_registration_screen/view/customer_registration_otp_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../login_screen/view/login_screen_view.dart';
import '../api/customer_registration_api.dart';
import '../view/customer_registration_view_upload_image.dart';

class CustomerRegistrationController extends GetxController {
  final ImagePicker picker = ImagePicker();
  @override
  void onInit() {
    super.onInit();
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  RxBool isUploading = false.obs;

  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController middle = TextEditingController();
  TextEditingController contactnumber = TextEditingController();
  TextEditingController emailAddress = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  XFile? image;

  RxString imagepath = "".obs;
  RxString imageName = "".obs;

  String verifIDReceived = "";

  RxBool isObscure = true.obs;
  RxBool isObscureconfirm = true.obs;

  @override
  void onClose() {
    super.onClose();
  }

  openGallery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    imagepath.value = image!.path;
    imageName.value = image!.name;
  }

  openCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
    imagepath.value = image!.path;
    imageName.value = image!.name;
  }

  verifiyNumber() {
    isUploading.value = true;
    auth.verifyPhoneNumber(
        // phoneNumber: "09367325510",
        phoneNumber: "+63${contactnumber.text}",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            print("You are login successfully");
            print(value.credential);
            print("smsCode: ${credential.smsCode}");
          });
        },
        verificationFailed: (FirebaseAuthException exception) {
          print(exception.message);
        },
        codeSent: (String verificationID, int? resendToken) {
          verifIDReceived = verificationID;
          print(verificationID);
          print(resendToken);
          isUploading.value = false;
          Get.to(() => CustomerRegistrationOtp());
        },
        codeAutoRetrievalTimeout: (String verificationID) {},
        timeout: Duration(seconds: 60));
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential, context) async {
    try {
      final authCredential =
          await auth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
        uploadImage();
        // controller.addUser(context);
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  add_customer_account() async {
    bool result = await CustomerRegistrationApi.createCustomerAccount(
        firstname: firstname.text,
        middlename: middle.text,
        lastname: lastname.text,
        password: password.text,
        username: username.text,
        email: emailAddress.text,
        imageName: imageName.value.toString());
    if (result == true) {
      Get.offAll(LoginScreen());
      Get.snackbar("Message", "Congratulations! Account succesfully created.",
          colorText: Colors.white,
          backgroundColor: Colors.lightGreen,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 5));
    } else {
      Get.snackbar(
        "Message",
        "Sorry. Please try again later",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  uploadImage() async {
    bool result = await CustomerRegistrationApi.uploadImage(
        imagename: imageName.value.toString(), filepath: imagepath.value);
    if (result == true) {
      add_customer_account();
      print("image uploaded");
    } else {}
  }

  checkIfEmailAddressExist() async {
    var result =
        await CustomerRegistrationApi.checkEmail(email: emailAddress.text);
    if (result == false) {
      Get.snackbar(
        "Message",
        "Sorry.. please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.TOP,
      );
    } else if (result > 0) {
      Get.snackbar(
        "Message",
        "Email address already exist!",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.TOP,
      );
    } else {
      checkIfusernameExist();
    }
  }

  checkIfusernameExist() async {
    var result =
        await CustomerRegistrationApi.checkUsername(username: username.text);
    if (result == false) {
      Get.snackbar(
        "Message",
        "Sorry.. please try again later.",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.TOP,
      );
    } else if (result > 0) {
      Get.snackbar(
        "Message",
        "User name already exist!",
        colorText: Colors.white,
        backgroundColor: Colors.lightGreen,
        snackPosition: SnackPosition.TOP,
      );
    } else {
      Get.to(() => CustomerRegistrationUploadImage());
    }
  }
}
