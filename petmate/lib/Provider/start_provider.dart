import 'dart:async';

import 'package:flutter/material.dart';
import 'package:petmate/DataTools/secure_storage.dart';

class StartProvider extends ChangeNotifier {
  SecureStorage secure = SecureStorage();

  Future<bool> PassOnboarding() async {
    String status = await secure.Read('onboarding');
    print('확인 1: $status');
    await Future.delayed(Duration(seconds: 2));
    if (status != '') {
      bool status_bool = bool.parse(status);
      print('확인 2 : $status_bool');
      if (status_bool) {
        return true;
      } else {
        secure.Write('onboarding', 'true');
        return false;
      }
    } else {
      secure.Write('onboarding', 'true');
      return false;
    }
  }
}
