import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../color_class.dart';
import '../controller/deceased_filling_controller.dart';
import '../model/deceased_filling_model.dart';

class DeceasedFillingView extends GetView<DeceasedFillingController> {
  const DeceasedFillingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(DeceasedFillingController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
          padding: EdgeInsets.all(3.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  "Deceased Information",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 6.h,
                  width: 100.w,
                  child: TextField(
                    obscureText: false,
                    controller: controller.fname,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 1.h, left: 3.w),
                      hintStyle:
                          TextStyle(fontSize: 12.sp, color: Colors.black),
                      labelStyle:
                          TextStyle(fontSize: 12.sp, color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      labelText: 'First Name',
                      hintText: 'Enter First Name',
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 6.h,
                  width: 100.w,
                  child: TextField(
                    obscureText: false,
                    controller: controller.mname,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 1.h, left: 3.w),
                      hintStyle:
                          TextStyle(fontSize: 12.sp, color: Colors.black),
                      labelStyle:
                          TextStyle(fontSize: 12.sp, color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      labelText: 'Middle Name',
                      hintText: 'Enter Middle Name',
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 6.h,
                  width: 100.w,
                  child: TextField(
                    obscureText: false,
                    controller: controller.lname,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 1.h, left: 3.w),
                      hintStyle:
                          TextStyle(fontSize: 12.sp, color: Colors.black),
                      labelStyle:
                          TextStyle(fontSize: 12.sp, color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      labelText: 'Last Name',
                      hintText: 'Enter Last Name',
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 30.w,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Civil Status",
                            style:
                                TextStyle(fontSize: 8.sp, color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                        PopupMenuButton(
                            child: Container(
                              height: 6.h,
                              width: 30.w,
                              padding: EdgeInsets.only(left: 3.w),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4)),
                              alignment: Alignment.centerLeft,
                              child: Obx(
                                () => Text(
                                  controller.civilStatus.value,
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.black),
                                ),
                              ),
                            ),
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    onTap: () {
                                      controller.civilStatus.value = "Single";
                                    },
                                    child: Text("Single"),
                                    value: "Single",
                                  ),
                                  PopupMenuItem(
                                    onTap: () {
                                      controller.civilStatus.value = "Maried";
                                    },
                                    child: Text("Maried"),
                                    value: "Maried",
                                  ),
                                  PopupMenuItem(
                                    onTap: () {
                                      controller.civilStatus.value = "Widowed ";
                                    },
                                    child: Text("Widowed "),
                                    value: "Widowed ",
                                  ),
                                  PopupMenuItem(
                                    onTap: () {
                                      controller.civilStatus.value =
                                          "Separated ";
                                    },
                                    child: Text("Separated "),
                                    value: "Separated ",
                                  ),
                                  PopupMenuItem(
                                    onTap: () {
                                      controller.civilStatus.value =
                                          "Divorced ";
                                    },
                                    child: Text("Divorced "),
                                    value: "Divorced ",
                                  ),
                                ]),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 30.w,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Gender",
                            style:
                                TextStyle(fontSize: 8.sp, color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                        PopupMenuButton(
                            child: Container(
                              height: 6.h,
                              width: 30.w,
                              padding: EdgeInsets.only(left: 3.w),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4)),
                              alignment: Alignment.centerLeft,
                              child: Obx(
                                () => Text(
                                  controller.gender.value,
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.black),
                                ),
                              ),
                            ),
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                    onTap: () {
                                      controller.gender.value = "Male";
                                    },
                                    child: Text("Male"),
                                    value: "Male",
                                  ),
                                  PopupMenuItem(
                                    onTap: () {
                                      controller.gender.value = "Female";
                                    },
                                    child: Text("Female"),
                                    value: "Female",
                                  ),
                                ]),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 30.w,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Age",
                            style:
                                TextStyle(fontSize: 8.sp, color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                        PopupMenuButton(
                            child: Container(
                              height: 6.h,
                              width: 30.w,
                              padding: EdgeInsets.only(left: 3.w),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(4)),
                              alignment: Alignment.centerLeft,
                              child: Obx(
                                () => Text(
                                  controller.age.value.toString(),
                                  style: TextStyle(
                                      fontSize: 12.sp, color: Colors.black),
                                ),
                              ),
                            ),
                            itemBuilder: (context) {
                              return controller.ageList.map((AgeModel element) {
                                return PopupMenuItem(
                                  onTap: () {
                                    controller.age.value = element.age;
                                  },
                                  value: element,
                                  child: Text("${element.age}"),
                                );
                              }).toList();
                            }),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 30.w,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Date Born",
                            style:
                                TextStyle(fontSize: 8.sp, color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                        InkWell(
                          onTap: () {
                            controller.showCallendarDateBorn();
                          },
                          child: Container(
                            height: 6.h,
                            width: 30.w,
                            padding: EdgeInsets.only(left: 3.w),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4)),
                            alignment: Alignment.centerLeft,
                            child: Obx(
                              () => Text(
                                controller.dateBorn.value,
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 30.w,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Date Died",
                            style:
                                TextStyle(fontSize: 8.sp, color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                        InkWell(
                          onTap: () {
                            controller.showCallendarDateDied();
                          },
                          child: Container(
                            height: 6.h,
                            width: 30.w,
                            padding: EdgeInsets.only(left: 3.w),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4)),
                            alignment: Alignment.centerLeft,
                            child: Obx(
                              () => Text(
                                controller.dateDied.value,
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 30.w,
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Burial Date",
                            style:
                                TextStyle(fontSize: 8.sp, color: Colors.black),
                          ),
                        ),
                        SizedBox(
                          height: .5.h,
                        ),
                        InkWell(
                          onTap: () {
                            controller.showCallendarBurialDate();
                          },
                          child: Container(
                            height: 6.h,
                            width: 30.w,
                            padding: EdgeInsets.only(left: 3.w),
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(4)),
                            alignment: Alignment.centerLeft,
                            child: Obx(
                              () => Text(
                                controller.dateBurial.value,
                                style: TextStyle(
                                    fontSize: 12.sp, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 6.h,
                  width: 100.w,
                  child: TextField(
                    obscureText: false,
                    controller: controller.address,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 1.h, left: 3.w),
                      hintStyle:
                          TextStyle(fontSize: 12.sp, color: Colors.black),
                      labelStyle:
                          TextStyle(fontSize: 12.sp, color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      labelText: 'Address',
                      hintText: 'Enter Address',
                    ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  height: 6.h,
                  width: 100.w,
                  child: TextField(
                    obscureText: false,
                    controller: controller.relationship,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 1.h, left: 3.w),
                      hintStyle:
                          TextStyle(fontSize: 12.sp, color: Colors.black),
                      labelStyle:
                          TextStyle(fontSize: 12.sp, color: Colors.black),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4)),
                      labelText: 'Relationship of the Deceased',
                      hintText: 'Enter Relationship',
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  "Required Documents",
                  style:
                      TextStyle(fontWeight: FontWeight.w500, fontSize: 20.sp),
                ),
                Divider(
                  color: Colors.grey,
                ),
                Container(
                  padding: EdgeInsets.only(left: 3.w, right: 3.w),
                  child: Obx(
                    () => controller.listOfImage.length == 0
                        ? SizedBox()
                        : GridView.builder(
                            padding: EdgeInsets.only(top: 1.h),
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1,
                              crossAxisCount: 2,
                            ),
                            itemCount: controller.listOfImage.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                height: 10.h,
                                width: 85.w,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: FileImage(File(controller
                                            .listOfImage[index].imagePath))),
                                    shape: BoxShape.rectangle,
                                    border: Border.all(color: Colors.black)),
                                alignment: Alignment.center,
                              );
                            },
                          ),
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  width: 100.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          controller.addImageCamera();
                        },
                        child: Container(
                          height: 7.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              color: AppColor.mainColors,
                              borderRadius: BorderRadius.circular(12)),
                          alignment: Alignment.center,
                          child: Text(
                            "Camera",
                            style: TextStyle(
                              letterSpacing: 2,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 2.w,
                      ),
                      InkWell(
                        onTap: () {
                          controller.addImageGallery();
                        },
                        child: Container(
                          height: 7.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                              color: AppColor.mainColors,
                              borderRadius: BorderRadius.circular(12)),
                          alignment: Alignment.center,
                          child: Text(
                            "Gallery",
                            style: TextStyle(
                              letterSpacing: 2,
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Divider(
                  color: Colors.grey,
                ),
                SizedBox(
                  height: 4.h,
                ),
                Obx(() => controller.isFilingDeceased.value == false
                    ? InkWell(
                        onTap: () {
                          if (controller.fname.text.isEmpty ||
                              controller.lname.text.isEmpty ||
                              controller.mname.text.isEmpty ||
                              controller.address.text.isEmpty ||
                              controller.relationship.text.isEmpty) {
                            Get.snackbar("Message", "Oops, Missing input.",
                                colorText: Colors.white,
                                backgroundColor: Colors.lightGreen,
                                snackPosition: SnackPosition.BOTTOM,
                                duration: Duration(seconds: 4));
                          } else if (controller.listOfImage.length == 0) {
                            Get.snackbar("Message",
                                "Please add required documents of the deceased",
                                colorText: Colors.white,
                                backgroundColor: Colors.lightGreen,
                                snackPosition: SnackPosition.BOTTOM,
                                duration: Duration(seconds: 4));
                          } else {
                            controller.fileDeceased();
                          }
                        },
                        child: Container(
                          height: 12.h,
                          width: 100.w,
                          alignment: Alignment.center,
                          child: Container(
                            height: 7.h,
                            width: 88.w,
                            decoration: BoxDecoration(
                                color: AppColor.mainColors,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            alignment: Alignment.center,
                            child: Text(
                              "D O N E",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      )
                    : Container(
                        height: 12.h,
                        width: 100.w,
                        alignment: Alignment.center,
                        child: Container(
                          height: 7.h,
                          width: 88.w,
                          decoration: BoxDecoration(
                              color: AppColor.mainColors,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(10)),
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.all(1.h),
                            child:
                                CircularProgressIndicator(color: Colors.white),
                          ),
                        ),
                      )),
              ],
            ),
          )),
    );
  }
}
