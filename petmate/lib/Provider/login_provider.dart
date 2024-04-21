import 'package:flutter/material.dart';
import 'package:petmate/DataTools/firebase.dart';
import 'package:petmate/DataTools/secure_storage.dart';
import 'package:petmate/Model/user_model.dart';

class LoginProvider extends ChangeNotifier {
  bool? auto_login;
  SecureStorage storage = SecureStorage();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  FirebaseData firebase = FirebaseData();
  UserModel user = UserModel();

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

  void Reset() {
    email.text = '';
    password.text = '';
    notifyListeners();
  }

  void KaKao_Login(Map<String, String> data) {
    email.text = data['email']!;
    password.text = data['password']!;
    Login();
    notifyListeners();
  }

  Future<bool> Login() async {
    Map<String, dynamic> data = await firebase.Login(email.text, password.text);
    if (data.isNotEmpty) {
      user = UserModel.FromJson(data);
      password_wrong = '';
      email_wrong = '';
      notifyListeners();
      return true;
    } else {
      password_wrong = '이메일 혹은 비밀번호가 일치하지 않습니다.';
      email_wrong = '이메일 혹은 비밀번호가 일치하지 않습니다.';
      notifyListeners();
      return false;
    }
  }
}
