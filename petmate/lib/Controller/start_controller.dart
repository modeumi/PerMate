import 'dart:async';

import 'package:get/get.dart';
import 'package:petmate/DataTools/secure_storage.dart';

class StartController extends GetxController {
  SecureStorage secure = SecureStorage();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    PassOnboarding();
  }

  Future<void> PassOnboarding() async {
    String status = await secure.Read('onboarding');
    print('확인 1: $status');
    await Future.delayed(Duration(seconds: 2));
    if (status != '') {
      bool status_bool = bool.parse(status);
      print('확인 2 : $status_bool');
      if (status_bool) {
        Get.toNamed('/login_select');
      } else {
        secure.Write('onboarding', 'true');
        Get.toNamed('/onboarding');
      }
    } else {
      secure.Write('onboarding', 'true');
      Get.toNamed('/onboarding');
    }
  }
}
