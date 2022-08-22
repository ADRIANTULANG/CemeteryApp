import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageServices extends GetxController {
  final storage = GetStorage();

  @override
  void onInit() {
    super.onInit();
  }

  saveCredentials({
    required String accntId,
    required String username,
    required String password,
    required String userId,
    required String usertypeId,
    required String status,
    required String code,
  }) {
    storage.write("accntId", accntId);
    storage.write("username", username);
    storage.write("password", password);
    storage.write("userId", userId);
    storage.write("usertypeId", usertypeId);
    storage.write("status", status);
    storage.write("code", code);
  }

  saveClientCredentials({
    required String clientId,
    required String clientFirstName,
    required String clientMiddlename,
    required String clientLastname,
    required String email,
    required String clientImage,
  }) {
    storage.write("clientId", clientId);
    storage.write("clientFirstName", clientFirstName);
    storage.write("clientMiddlename", clientMiddlename);
    storage.write("clientLastname", clientLastname);
    storage.write("email", email);
    storage.write("clientImage", clientImage);
  }

  saveCemeteryDetails({
    required String cementeryId,
    required String cmName,
    required String cmLongitude,
    required String cmLatitude,
    required String cDescription,
    required String cmEmail,
    required String cmAddress,
    required String cemImage,
  }) {
    storage.write("cementeryId", cementeryId);
    storage.write("cmName", cmName);
    storage.write("cmLongitude", cmLongitude);
    storage.write("cmLatitude", cmLatitude);
    storage.write("cDescription", cDescription);

    storage.write("cmEmail", cmEmail);
    storage.write("cmAddress", cmAddress);
    storage.write("cemImage", cemImage);
  }

  removeStorageCredentials() {
    storage.remove("accntId");
    storage.remove("username");
    storage.remove("password");
    storage.remove("userId");
    storage.remove("usertypeId");
    storage.remove("status");
    storage.remove("code");

    storage.remove("clientId");
    storage.remove("clientFirstName");
    storage.remove("clientMiddlename");
    storage.remove("clientLastname");
    storage.remove("email");
    storage.remove("clientImage");

    storage.remove("cementeryId");
    storage.remove("cmName");
    storage.remove("cmLongitude");
    storage.remove("cmLatitude");
    storage.remove("cDescription");
    storage.remove("cmEmail");
    storage.remove("cmAddress");
    storage.remove("cemImage");
  }
}
