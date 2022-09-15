import 'dart:convert';

List<ChatMessageModel> chatMessageModelFromJson(String str) =>
    List<ChatMessageModel>.from(
        json.decode(str).map((x) => ChatMessageModel.fromJson(x)));

String chatMessageModelToJson(List<ChatMessageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ChatMessageModel {
  ChatMessageModel({
    required this.chatmessage,
    required this.receiver,
    required this.sender,
    required this.time,
  });

  String chatmessage;
  String receiver;
  String sender;
  DateTime time;

  factory ChatMessageModel.fromJson(Map<String, dynamic> json) =>
      ChatMessageModel(
        chatmessage: json["chatmessage"],
        receiver: json["receiver"],
        sender: json["sender"],
        time: DateTime.parse(json["time"]),
      );

  Map<String, dynamic> toJson() => {
        "chatmessage": chatmessage,
        "receiver": receiver,
        "sender": sender,
        "time": time.toIso8601String(),
      };
}
