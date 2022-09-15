import 'dart:async';
import 'dart:convert';

import 'package:cemeteryapp/storage_services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/chat_messages_model.dart';

class ChatScreenController extends GetxController {
  Stream? streamChats;

  TextEditingController message = TextEditingController();

  RxList<ChatMessageModel> chatMessages = <ChatMessageModel>[].obs;

  ScrollController scrollController = ScrollController();

  StreamSubscription<dynamic>? listener;
  RxString cemeteryID = "".obs;
  RxString clientID = "".obs;
  RxString senderIs = "".obs;
  @override
  void onInit() async {
    cemeteryID.value = await Get.arguments['cemeteryID'];
    clientID.value = await Get.arguments['clientID'];
    if (Get.find<StorageServices>().storage.read('clientId') == null) {
      senderIs.value = await "cm${cemeteryID.value}";
    } else {
      senderIs.value = await "cl${clientID.value}";
    }
    print(cemeteryID.value);
    print(clientID.value);
    streamChats = await FirebaseFirestore.instance.collection('chats').where(
        "receiver",
        whereIn: ['cm${cemeteryID.value}', 'cl${clientID.value}']).snapshots();
    await readData();
    Future.delayed(Duration(milliseconds: 500), () {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    });
    super.onInit();
  }

  bool isInitializing = true;

  @override
  void onClose() {
    listener!.cancel();
    super.onClose();
  }

  Future sendMessage({required String message}) async {
    final chat = await FirebaseFirestore.instance.collection('chats').doc();
    if (Get.find<StorageServices>().storage.read('clientId') == null) {
      final data = {
        "chatmessage": message,
        "receiver": "cl${clientID.value}",
        "sender": "cm${cemeteryID.value}",
        "time": DateTime.now().toString(),
      };
      await chat.set(data);
    } else {
      final data = {
        "chatmessage": message,
        "receiver": "cm${cemeteryID.value}",
        "sender": "cl${clientID.value}",
        "time": DateTime.now().toString(),
      };
      await chat.set(data);
    }

    print("done");
  }

  Future readData() async {
    listener = streamChats!.listen((event) {
      List newData = [];
      for (var doc in event.docs) {
        var json = {
          "chatmessage": doc['chatmessage'].toString(),
          "receiver": doc['receiver'].toString(),
          "sender": doc['sender'].toString(),
          "time": doc['time'].toString(),
        };
        newData.add(json);
      }

      chatMessages.assignAll(chatMessageModelFromJson(jsonEncode(newData)));
      chatMessages.sort((a, b) {
        return (a.time.compareTo(b.time));
      });
      print("data:" + jsonEncode(newData.reversed.toList()));
      Future.delayed(Duration(milliseconds: 500), () {
        scrollController.jumpTo(scrollController.position.maxScrollExtent);
      });
    });
  }
}
