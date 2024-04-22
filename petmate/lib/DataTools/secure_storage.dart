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

  Future<void> CheckAutoLogin() async {}

  Future<String> Read(String key) async {
    String read = await storage.read(key: key) ?? '';
    return read;
  }

  Future<void> Write(String key, String value) async {
    await storage.write(key: key, value: value);
  }
}
