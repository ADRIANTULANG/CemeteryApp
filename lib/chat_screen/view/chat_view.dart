import 'package:cemeteryapp/color_class.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../controller/chat_controller.dart';

class ChatScreenView extends GetView<ChatScreenController> {
  const ChatScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ChatScreenController());
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(left: 5.w, right: 5.w, top: 6.5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Chat",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 26.sp,
                  letterSpacing: 3),
            ),
            Expanded(
              child: Container(
                child: Obx(
                  () => ListView.builder(
                    controller: controller.scrollController,
                    itemCount: controller.chatMessages.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: Align(
                          alignment: controller.senderIs.value ==
                                  controller.chatMessages[index].sender
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: controller.senderIs.value ==
                                    controller.chatMessages[index].sender
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    left: 2.5.w,
                                    right: 2.5.w,
                                    top: 1.5.h,
                                    bottom: 1.5.h),
                                decoration: BoxDecoration(
                                    color: AppColor.mainColors,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Text(
                                  controller.chatMessages[index].chatmessage,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 1.5,
                                      fontSize: 11.sp),
                                ),
                              ),
                              SizedBox(
                                height: .5.h,
                              ),
                              Text(
                                DateFormat.yMMMEd().format(
                                        controller.chatMessages[index].time) +
                                    " " +
                                    DateFormat.jm().format(
                                        controller.chatMessages[index].time),
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 1.5,
                                    fontSize: 7.sp),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: 9.h,
              width: 100.w,
              // color: AppColor.mainColors,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 7.h,
                    width: 75.w,
                    child: TextField(
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.5,
                          fontSize: 11.sp),
                      controller: controller.message,
                      obscureText: false,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 2.w, bottom: 1.h),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(7)),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 1.w,
                  ),
                  InkWell(
                    onTap: () {
                      if (controller.message.text.isNotEmpty) {
                        controller.sendMessage(
                            message: controller.message.text);
                        controller.message.clear();
                      }
                    },
                    child: Icon(Icons.send_rounded,
                        size: 25.sp, color: AppColor.mainColors),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
