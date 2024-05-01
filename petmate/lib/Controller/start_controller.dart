import 'dart:async';

import 'package:get/get.dart';
import 'package:petmate/DataTools/secure_storage.dart';

class StartController extends GetxController {
  SecureStorage secure = SecureStorage();

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await PassOnboarding();
  }

  Future<void> PassOnboarding() async {
    Map<String, dynamic> status = await secure.Read(['onboarding']);
    print('확인 1: $status');
    await Future.delayed(Duration(seconds: 2));
    if (status['onboarding'] != '') {
      bool status_bool = bool.parse(status['onboarding']);
      print('확인 2 : $status_bool');
      if (status_bool) {
        Get.offAllNamed('/login_select');
      } else {
        secure.Write({'onboarding': 'true'});
        Get.offAllNamed('/onboarding');
      }
    } else {
      secure.Write({'onboarding': 'true'});
      Get.offAllNamed('/onboarding');
    }
  }
}
