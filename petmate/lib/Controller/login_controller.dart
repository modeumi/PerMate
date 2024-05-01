import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petmate/DataTools/firebase.dart';
import 'package:petmate/DataTools/secure_storage.dart';
import 'package:petmate/Model/user_model.dart';

class LoginController extends GetxController {
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

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    await Check_AutoLogin();
  }

  Future<void> Check_AutoLogin() async {
    Map<String, dynamic> status = await storage.Read(['auto']);
    print(status);
    if (status['auto'] != null) {
      bool auto_status = bool.parse(status['auto']);
      if (auto_status) {
        Map<String, dynamic> data = await storage.Read(['email', 'password']);
        email.text = data['email'];
        password = data['password'];
        Login();
      }
    }
  }

  void Reset() {
    email.text = '';
    password.text = '';
    update();
  }

  Future<bool> KaKao_Login(Map<String, String> data) async {
    email.text = data['email']!;
    password.text = data['password']!;
    bool login = await Login();
    update();
    return login;
  }

  Future<bool> Login() async {
    Map<String, dynamic> data = await firebase.Login(email.text, password.text);
    if (data.isNotEmpty) {
      await storage.Write({'email': email.text, 'password': password.text});
      user = UserModel.FromJson(data);
      password_wrong = '';
      email_wrong = '';
      update();
      return true;
    } else {
      password_wrong = '이메일 혹은 비밀번호가 일치하지 않습니다.';
      email_wrong = '이메일 혹은 비밀번호가 일치하지 않습니다.';
      update();
      return false;
    }
  }
}
