import 'package:cemeteryapp/color_class.dart';
import 'package:cemeteryapp/endPoints.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../../storage_services.dart';
import '../controller/home_screen_cemetery_controller.dart';

class HomescreenCemeteryView extends GetView<HomeScreenCemeteryController> {
  const HomescreenCemeteryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: [
                Container(
                  height: 40.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      color: AppColor.mainColors,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "${AppEndpoint.imageEndpoint}/${Get.find<StorageServices>().storage.read("cemImage")}"))),
                ),
                Positioned(
                  bottom: 2.5.w,
                  left: 2.w,
                  right: 2.w,
                  child: Container(
                    height: 15.h,
                    width: 100.w,
                    padding: EdgeInsets.only(left: 2.w, top: 2.w),
                    decoration: BoxDecoration(
                        color: AppColor.mainColors,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Get.find<StorageServices>().storage.read("cmName"),
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16.sp,
                          ),
                        ),
                        Text(
                          Get.find<StorageServices>().storage.read("cmAddress"),
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 10.sp,
                          ),
                        ),
                        Text(
                          Get.find<StorageServices>().storage.read("cmEmail"),
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 10.sp,
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Expanded(
                            child: Container(
                          child: Text(
                            Get.find<StorageServices>()
                                .storage
                                .read("cDescription"),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 3,
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 8.sp,
                            ),
                          ),
                        ))
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 1,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
