import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:petmate/View/login_select.dart';
import 'package:petmate/View/onboarding.dart';

class SecureStorage {
  FlutterSecureStorage storage = FlutterSecureStorage();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<void> ShowOnboardingCheck() async {
    bool pass_status =
        bool.parse(await storage.read(key: 'onboarding') ?? 'false');
    if (pass_status) {
      navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (context) => LoginSelect(),
        ),
      );
    } else {
      navigatorKey.currentState!.push(
        MaterialPageRoute(
          builder: (context) => Onboarding(),
        ),
      );
    }
  }

  Future<void> PassOnboarding() async {
    await storage.write(key: 'onboarding', value: 'true');
  }

  Future<Map<String, dynamic>> Read(List<String> keys) async {
    Map<String, dynamic> send_data = {};
    for (String key in keys) {
      send_data[key] = await storage.read(key: key);
    }
    return send_data;
  }

  Future<void> Write(Map<String, dynamic> datas) async {
    for (MapEntry<String, dynamic> data in datas.entries) {
      await storage.write(key: data.key, value: data.value);
    }
  }
}
