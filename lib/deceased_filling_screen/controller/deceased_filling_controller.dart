import 'package:cemeteryapp/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../api/deceased_filling_screen_api.dart';
import '../model/deceased_filling_model.dart';
import 'package:sizer/sizer.dart';

class DeceasedFillingController extends GetxController {
  final ImagePicker picker = ImagePicker();
  RxString civilStatus = "Single".obs;
  RxInt age = 0.obs;
  RxString gender = "Male".obs;
  RxBool isFilingDeceased = false.obs;

  TextEditingController address = TextEditingController();
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController mname = TextEditingController();
  TextEditingController relationship = TextEditingController();
  RxString dateBorn =
      "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}"
          .obs;
  RxString dateDied =
      "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}"
          .obs;

  RxString dateBurial =
      "${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}"
          .obs;
  RxList<AgeModel> ageList = <AgeModel>[].obs;

  XFile? image;
  RxList<ImageListModel> listOfImage = <ImageListModel>[].obs;
  RxString lotid = "".obs;
  RxString cemeteryID = "".obs;

  @override
  void onInit() async {
    lotid.value = await Get.arguments["lotid"];
    cemeteryID.value = await Get.arguments["cemeteryID"];
    for (var i = 0; i < 101; i++) {
      ageList.add(AgeModel(age: i));
    }
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onSelectDateBorn(DateRangePickerSelectionChangedArgs args) {
    dateBorn.value = "${args.value.year}-${args.value.month}-${args.value.day}";
    Get.back();
  }

  addImageGallery() async {
    XFile? imageSelected = await picker.pickImage(source: ImageSource.gallery);
    if (imageSelected != null) {
      String imagePath = imageSelected.path;
      ImageListModel imageModel =
          ImageListModel(imagePath: imagePath, imageFile: imageSelected);
      listOfImage.add(imageModel);
    }
  }

  addImageCamera() async {
    XFile? imageSelected = await picker.pickImage(source: ImageSource.camera);
    if (imageSelected != null) {
      String imagePath = imageSelected.path;
      ImageListModel imageModel =
          ImageListModel(imagePath: imagePath, imageFile: imageSelected);
      listOfImage.add(imageModel);
    }
  }

  showCallendarDateBorn() {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      height: 50.h,
      width: 100.w,
      child: Container(
        padding: EdgeInsets.all(3.w),
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: 100.w,
              alignment: Alignment.center,
              child: Text(
                "Date Born",
                style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              child: SfDateRangePicker(
                view: DateRangePickerView.month,
                onSelectionChanged: onSelectDateBorn,
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void onSelectDateDied(DateRangePickerSelectionChangedArgs args) {
    dateDied.value = "${args.value.year}-${args.value.month}-${args.value.day}";
    Get.back();
  }

  showCallendarDateDied() {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      height: 50.h,
      width: 100.w,
      padding: EdgeInsets.all(3.w),
      child: Container(
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: 100.w,
              alignment: Alignment.center,
              child: Text(
                "Date Died",
                style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              child: SfDateRangePicker(
                view: DateRangePickerView.month,
                onSelectionChanged: onSelectDateDied,
              ),
            ),
          ],
        ),
      ),
    ));
  }

  void onSelectBurialDate(DateRangePickerSelectionChangedArgs args) {
    dateBurial.value =
        "${args.value.year}-${args.value.month}-${args.value.day}";
    Get.back();
  }

  showCallendarBurialDate() {
    Get.bottomSheet(Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12))),
      height: 50.h,
      width: 100.w,
      child: Container(
        padding: EdgeInsets.all(3.w),
        child: Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Container(
              width: 100.w,
              alignment: Alignment.center,
              child: Text(
                "Date Born",
                style: TextStyle(
                    fontSize: 15.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              child: SfDateRangePicker(
                view: DateRangePickerView.month,
                onSelectionChanged: onSelectBurialDate,
              ),
            ),
          ],
        ),
      ),
    ));
  }

  fileDeceased() async {
    isFilingDeceased.value = true;
    String isInserted = await DeceasedFillingApi.fileDeceased(
        dcs_gender: gender.value,
        dcs_fname: fname.text,
        dcs_lname: lname.text,
        dcs_mname: mname.text,
        dcs_civil_status: civilStatus.value,
        dcs_age: age.value.toString(),
        dcs_address: address.text,
        dcs_do_birth: dateBorn.value,
        dcs_do_death: dateDied.value,
        sched_of_burial: dateBurial.value,
        lot_id: lotid.value,
        clientID: Get.find<StorageServices>().storage.read('clientId'));
    if (isInserted != false) {
      isFilingDeceased.value = false;
      createDeceasedDocuments();
      Get.back();
      Get.snackbar("Thank you!", "You succesfully created your booking",
          colorText: Colors.white,
          backgroundColor: Colors.lightGreen,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 5));
    } else {}
  }

  createDeceasedDocuments() async {
    for (var i = 0; i < listOfImage.length; i++) {
      await DeceasedFillingApi.uploadImage(
          imagename: listOfImage[i].imageFile!.name,
          filepath: listOfImage[i].imageFile!.path);
      await DeceasedFillingApi.createDeceasedDocuments(
          cd_image: listOfImage[i].imageFile!.name,
          cd_description: "Documents",
          cementery_id: cemeteryID.value);
    }
  }
}
