import 'package:flutter/material.dart';
import 'package:petmate/DataTools/secure_storage.dart';

class LoginProvider extends ChangeNotifier {
  bool? auto_login;
  SecureStorage storage = SecureStorage();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool email_check = true;
  String email_wrong = '';
  bool password_check = true;
  String password_wrong = '';

  Future<bool> Check_AutoLogin() async {
    String status = await storage.Read('auto');
    if (status != '') {
      bool auto_status = bool.parse(status);
      if (auto_status) {
        return true;
      } else {
        return false;
      }
    }
    return false;
  }
}
