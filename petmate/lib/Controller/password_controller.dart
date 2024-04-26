import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petmate/DataTools/google_smtp.dart';
import 'package:petmate/Util/util.dart';

class PasswordProvider extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController verification = TextEditingController();

  bool email_valid = false;

  String invaild_info = '';
  bool code_status = false;

  bool exist_check = false;

  bool info_check = true;
  bool code_check = true;

  bool mail_send = false;

  String code = '';
  Timer? timer;

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
    bool email_valid = Email_Isvalid(email.text);
    if (email_valid) {
      Create_Code();
      await MailSender().SearchEmailSend(email.text, code);
    } else {
      info_check = false;
    }
    Email_Show_Text();
    print('코드체크 확인용');
    print(code_check);
    update();
  }

  void Code_Check() {
    if (code == verification.text) {
      code_check = true;
      code_status = true;
    } else {
      code_check = false;
    }
    Code_Show_Text();
  }

  void Email_Show_Text() {
    if (!email_valid) {
      invaild_info = '이메일 형식이 올바르지 않습니다.';
    } else if (!exist_check) {
      invaild_info = '정보에 맞는 계정이 존재하지 않습니다.';
    } else {
      invaild_info = '인증번호를 전송하였습니다.';
    }
    update();
  }

  void Code_Show_Text() {
    if (!code_check) {
      invaild_info = '인증번호가 올바르지 않습니다.';
    } else {
      invaild_info = '인증이 완료되었습니다.';
    }
    update();
  }

  void Info_Changer() {
    if (code_status) {
      code_check = false;
      code_status = false;
    }
    update();
  }
}
