import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petmate/DataTools/firebase.dart';
import 'package:petmate/DataTools/google_smtp.dart';
import 'package:petmate/Util/util.dart';

class JoinController extends GetxController {
  FirebaseData firebase = FirebaseData();

  TextEditingController email = TextEditingController();
  TextEditingController verification_code = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController nickname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password_check = TextEditingController();
  TextEditingController birth = TextEditingController();

  bool email_status = false;
  bool verification_code_status = false;
  bool name_status = false;
  bool nickname_status = false;
  bool password_status = false;
  bool password_check_status = false;
  bool gender_status = false;
  bool birth_status = false;

  bool email_checker = true;
  bool verification_code_checker = true;
  bool name_checker = true;
  bool nickname_checker = true;
  bool password_checker = true;
  bool password_check_checker = true;
  bool gender_checker = true;
  bool birth_checker = true;

  bool pass = false;

  bool email_duplication = true;
  bool email_valid = true;

  String email_fail = '';
  String verification_code_fail = '';
  String name_fail = '';
  String nickname_fail = '';
  String password_fail = '';
  String password_check_fail = '';
  String birth_fail = '';
  String gender = '';

  Timer? timer;
  bool entire = false;
  bool mailsend = false;

  Map<String, bool> agree = {
    'agree_1': false,
    'agree_2': false,
    'agree_3': false,
    'agree_4': false
  };
  List<String> gender_list = ['남성', '여성'];

  String code = '';

  void Create_Code() {
    Random random = Random();
    int randomNumber = random.nextInt(1000000);
    code = randomNumber.toString().padLeft(6, '0');
    update();
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer(Duration(minutes: 3), () {
      code = generateRandomString(10);
      update();
    });
  }

  String generateRandomString(int length) {
    const letters = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    final random = Random();
    return String.fromCharCodes(
      Iterable.generate(
        length,
        (_) => letters.codeUnitAt(random.nextInt(letters.length)),
      ),
    );
  }

  void Email_Check() async {
    email_status = false;
    email_valid = Email_Isvalid(email.text);
    email_duplication = await firebase.Duplication_Check_Email(email.text);
    if (email.text != '' && email_valid && email_duplication) {
      email_checker = true;
      Email_Valid();
      Create_Code();
      await MailSender().JoinEmailSend(email.text, code);
      update();
    } else {
      email_checker = false;
      Email_Valid();
    }
    JoinStatusCheck();
  }

  void Email_Valid() {
    if (!email_checker) {
      if (email.text == '') {
        email_fail = '이메일을 입력해주세요';
      } else if (!email_duplication) {
        email_fail = '이미 등록된 아이디입니다.';
      } else if (!email_valid) {
        email_fail = '이메일이 올바르지 않습니다.';
      } else {
        email_fail = '';
      }
    } else {
      email_fail = '인증번호를 전송하였습니다.';
      email_status = true;
    }
    update();
  }

  void Email_Changer() {
    email_status = false;
    update();
  }

  void Verification_Code_Check() {
    print(verification_code.text);
    print(code);
    if (verification_code.text == code) {
      verification_code_status = true;
      verification_code_checker = true;
    } else {
      verification_code_checker = false;
    }
    Verification_Code_Valid();
    JoinStatusCheck();
    update();
  }

  void Verification_Code_Valid() {
    email_fail = '';
    if (!verification_code_checker) {
      email_fail = '인증번호가 일치하지 않습니다.';
    } else {
      email_fail = '인증번호가 일치합니다.';
    }
    update();
  }

  void Verification_Code_Changer() {
    verification_code_status = false;
    update();
  }

  void Name_Check() {
    if (name.text != '' && Name_Isvalid(name.text)) {
      name_checker = true;
      name_status = true;
    } else {
      name_checker = false;
    }
    JoinStatusCheck();
    Name_Valid();
    update();
  }

  void Name_Valid() {
    if (!name_checker) {
      name_fail = '한글, 영문만 가능합니다.';
    } else {
      name_fail = '';
    }
    update();
  }

  void Name_Changer() {
    name_status = false;
    update();
  }

  void NickName_Check() {
    if (nickname.text != '' && NickName_Isvalid(nickname.text)) {
      nickname_status = true;
      nickname_checker = true;
    } else {
      nickname_checker = false;
    }
    JoinStatusCheck();
    NickName_Valid();
    update();
  }

  void NickName_Valid() {
    if (!nickname_checker) {
      nickname_fail = '한글, 영문,숫자만 가능합니다.';
    } else {
      nickname_fail = '사용가능한 닉네임입니다.';
    }
    update();
  }

  void NickName_Changer() {
    nickname_status = false;
    update();
  }

  void Password_Check() {
    password_status = false;
    if (password.text != '' && Password_Isvalid(password.text)) {
      password_status = true;
      password_checker = true;
    } else {
      password_checker = false;
    }
    Password_Valid();
    update();
  }

  void Password_Changer() {
    password_check.text = '';
    Password_Check_Check();
    update();
  }

  void Password_Valid() {
    if (!password_checker) {
      password_fail = '영문, 숫자, 특수문자 중 두가지 이상을 조합해주세요.';
    } else {
      password_fail = '';
    }
    update();
  }

  void Password_Check_Check() {
    password_check_status = false;
    if (password.text == password_check.text) {
      password_check_status = true;
      password_check_checker = true;
    } else {
      password_check_checker = false;
    }
    Password_Check_Valid();
    update();
  }

  void Password_Check_Valid() {
    if (!password_check_checker) {
      password_check_fail = '비밀번호가 일치하지 않습니다.';
    } else {
      password_check_fail = '비밀번호가 일치합니다.';
    }
    update();
  }

  void Agree_Check(String key) {
    agree[key] = !agree[key]!;
    if (agree.values.every((element) => element == true)) {
      entire = true;
    } else {
      entire = false;
    }
    update();
  }

  void Birth_Check() {
    if (birth.text != '') {
      birth_status = Birth_Isvalid(birth.text);
      if (!birth_status) {
        birth_checker = false;
        birth_fail = '생년월일이 올바르게 입력되지 않았습니다.';
      } else {
        birth_checker = true;
        birth_fail = '생년월일이 올바르게 입력되었습니다.';
      }
    } else {
      birth_fail = '생년월일을 입력해주세요..';
    }
    update();
  }

  void Select_Gender(String select) {
    gender = select;
    update();
  }

  void Entire_Click() {
    entire = !entire;
    if (!entire) {
      agree.forEach((key, value) {
        agree[key] = false;
      });
    } else {
      agree.forEach((key, value) {
        agree[key] = true;
      });
    }
    update();
  }

  void JoinStatusCheck() {
    if (email_status &&
        verification_code_status &&
        name_status &&
        nickname_status &&
        password_status &&
        password_check_status &&
        entire &&
        gender != '' &&
        birth_status) {
      pass = true;
    } else {
      pass = false;
    }
  }

  Future<void> Join_Push() async {
    if (email_status &&
        verification_code_status &&
        name_status &&
        nickname_status &&
        password_status &&
        password_check_status &&
        entire &&
        gender != '' &&
        birth_status) {
      print('회원가입 진입 성공');
      await Join();
    }
    update();
  }

  Future<void> Join() async {
    bool success = await firebase.Join(email.text, password.text, name.text,
        nickname.text, gender, birth.text, entire);
    pass = success;
    update();
  }
}
