import 'dart:async';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../../login_screen/view/login_screen_view.dart';
import '../api/cemetery_registration_api.dart';
import '../model/cemetery_registration_model.dart';
import 'package:geocoding/geocoding.dart';

import '../view/cemetery_registration_otp.dart';

class CemeteryRegistrationController extends GetxController {
  final ImagePicker picker = ImagePicker();
  Completer<GoogleMapController> mapcontroller = Completer();
  GoogleMapController? googleMapController;
  RxList<Marker> markers = <Marker>[].obs;

  RxBool isLoading = false.obs;

  RxDouble initialLatitude = 0.0.obs;
  RxDouble initialLongitude = 0.0.obs;
  TextEditingController placesString = TextEditingController();

  Timer? debounce;

  FirebaseAuth auth = FirebaseAuth.instance;

  String verifIDReceived = "";

  TextEditingController companyName = TextEditingController();
  TextEditingController contanctNo = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  double company_latitude = 0.0;
  double company_longitude = 0.0;

  @override
  void onInit() {
    if (Platform.isAndroid) {
      AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
    }
    super.onInit();
  }

  XFile? image;
  RxList<ImageModel> listOfImage = <ImageModel>[].obs;

  RxString imagepath = "".obs;

  @override
  void onClose() {
    super.onClose();
  }

  openGallery() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    imagepath.value = image!.path;
  }

  openCamera() async {
    image = await picker.pickImage(source: ImageSource.camera);
    imagepath.value = image!.path;
  }

  addImageGallery() async {
    XFile? imageSelected = await picker.pickImage(source: ImageSource.gallery);
    if (imageSelected != null) {
      String imagePath = imageSelected.path;
      ImageModel imageModel =
          ImageModel(imagePath: imagePath, imageFile: imageSelected);
      listOfImage.add(imageModel);
    }
  }

  addImageCamera() async {
    XFile? imageSelected = await picker.pickImage(source: ImageSource.camera);
    if (imageSelected != null) {
      String imagePath = imageSelected.path;
      ImageModel imageModel =
          ImageModel(imagePath: imagePath, imageFile: imageSelected);
      listOfImage.add(imageModel);
    }
  }

  searchPlaces({required String place, required BuildContext context}) async {
    markers.clear();
    try {
      List<Location> locations = await locationFromAddress(place);
      for (var i = 0; i < locations.length; i++) {
        print(locations[i].latitude);
        print(locations[i].longitude);
        markers.add(Marker(
          markerId: MarkerId(i.toString()),
          position: LatLng(locations[i].latitude, locations[i].longitude),
        ));

        googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
            CameraPosition(
                bearing: 192.8334901395799,
                target: LatLng(locations[i].latitude, locations[i].longitude),
                tilt: 59.440717697143555,
                zoom: 19.151926040649414)));
        company_latitude = locations[i].latitude;
        company_longitude = locations[i].longitude;
      }
    } on Exception catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            "Sorry we can't find the place. Please input complete address name. Thank you"),
        duration: Duration(seconds: 3),
      ));
    }
  }

  ontap_GoogleMap({required double latitude, required double longitude}) async {
    markers.clear();
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      for (var i = 0; i < placemarks.length; i++) {
        print(placemarks[i].country);
        print(placemarks[i].locality);
        print(placemarks[i].subLocality);
        print("----------");
      }
    } on Exception catch (e) {
      print("catch exception $e");
    }
    markers.add(Marker(
      markerId: MarkerId("new"),
      position: LatLng(latitude, longitude),
    ));
    googleMapController!.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            bearing: 192.8334901395799,
            target: LatLng(latitude, longitude),
            tilt: 59.440717697143555,
            zoom: 19.151926040649414)));
    company_latitude = latitude;
    company_longitude = longitude;
  }

  verifiyNumber() {
    auth.verifyPhoneNumber(
        // phoneNumber: "09367325510",
        phoneNumber: "+639367325510",
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
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
          Get.to(() => CemeteryRegistrationOtp());
        },
        codeAutoRetrievalTimeout: (String verificationID) {});
  }

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential, context) async {
    try {
      final authCredential =
          await auth.signInWithCredential(phoneAuthCredential);

      if (authCredential.user != null) {
        // Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen()));
        print("OTP SUCCESS");
        uploadCompanyLogo();
        // controller.addUser(context);
      }
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  createCemeteryAccount() async {
    String result = await CemeteryRegistrationApi.createCemeteryAccount(
        companyName: companyName.text,
        longitude: company_longitude.toString(),
        latitude: company_latitude.toString(),
        description: description.text,
        email: email.text,
        address: address.text,
        imageName: image!.name,
        username: username.text,
        password: password.text);
    if (result == "Error") {
    } else {
      uploadCompanyDocuments(cemeteryID: result);
    }
  }

  uploadCompanyLogo() async {
    bool result = await CemeteryRegistrationApi.uploadImage(
        imagename: image!.name, filepath: image!.path);
    if (result == true) {
      createCemeteryAccount();
    } else {}
  }

  uploadCompanyDocuments({required String cemeteryID}) async {
    for (var i = 0; i < listOfImage.length; i++) {
      await CemeteryRegistrationApi.uploadImage(
          imagename: listOfImage[i].imageFile!.name,
          filepath: listOfImage[i].imageFile!.path);
      await CemeteryRegistrationApi.cemeteryDocuments(
          cemeteryImage: listOfImage[i].imageFile!.name,
          cemeteryDescription: "Document",
          cemeteryID: cemeteryID);
    }
    Get.offAll(LoginScreen());
    Get.snackbar(
      "Message",
      "Congratulations! Your account was successfully created!",
      colorText: Colors.white,
      backgroundColor: Colors.lightGreen,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
