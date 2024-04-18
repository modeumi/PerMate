import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petmate/DataTools/firebase.dart';
import 'package:petmate/DataTools/google_smtp.dart';
import 'package:petmate/utill.dart';

class JoinProvider extends ChangeNotifier {
  FirebaseData firebase = FirebaseData();

  TextEditingController email = TextEditingController();
  TextEditingController verification_code = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController nickname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password_check = TextEditingController();
  TextEditingController birth = TextEditingController();

  Utill utill = Utill();

  bool email_status = true;
  bool verification_code_status = true;
  bool name_status = true;
  bool nickname_status = true;
  bool password_status = true;
  bool password_check_status = true;
  bool pass = false;
  bool birth_status = false;

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

  String code = '';

  void Create_Code() {
    Random random = Random();
    int randomNumber = random.nextInt(1000000);
    code = randomNumber.toString().padLeft(6, '0');
    notifyListeners();
    if (timer != null) {
      timer!.cancel();
    }
    timer = Timer(Duration(minutes: 3), () {
      code = generateRandomString(10);
      notifyListeners();
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
    email_valid = utill.Email_Isvalid(email.text);
    email_duplication = await firebase.Duplication_Check_Email(email.text);
    if (email.text != '' && email_valid && email_duplication) {
      email_status = true;
      mailsend = true;
      Email_Valid();
      Create_Code();
      await MailSender().EmailSend(email.text, code);
      notifyListeners();
    } else {
      email_status = false;
      Email_Valid();
    }
  }

  void Email_Valid() {
    if (!email_status) {
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
    }
    notifyListeners();
  }

  void Verification_Code_Check() {
    print(verification_code.text);
    print(code);
    if (verification_code.text == code) {
      verification_code_status = true;
    } else {
      verification_code_status = false;
    }
    notifyListeners();
    Verification_Code_Valid();
  }

  void Verification_Code_Valid() {
    email_fail = '';
    if (!verification_code_status) {
      email_fail = '인증번호가 일치하지 않습니다.';
    } else {
      email_fail = '인증번호가 일치합니다.';
    }
    notifyListeners();
  }

  void Name_Check() {
    if (name.text != '' && utill.Name_Isvalid(name.text)) {
      name_status = true;
    } else {
      name_status = false;
    }
    Name_Valid();
    notifyListeners();
  }

  void Name_Valid() {
    if (!name_status) {
      name_fail = '한글, 영문만 가능합니다.';
    } else {
      name_fail = '';
    }
    notifyListeners();
  }

  void NickName_Check() {
    if (nickname.text != '' && utill.NickName_Isvalid(nickname.text)) {
      nickname_status = true;
    } else {
      nickname_status = false;
    }
    NickName_Valid();
    notifyListeners();
  }

  void NickName_Valid() {
    if (!nickname_status) {
      nickname_fail = '한글, 영문,숫자만 가능합니다.';
    } else {
      nickname_fail = '사용가능한 닉네임입니다.';
    }
    notifyListeners();
  }

  void Password_Check() {
    if (password.text != '' && utill.Password_Isvalid(password.text)) {
      password_status = true;
    } else {
      password_status = false;
    }
    Password_Valid();
    notifyListeners();
  }

  void Password_Valid() {
    if (!password_status) {
      password_fail = '영문, 숫자, 특수문자 중 두가지 이상을 조합해주세요.';
    } else {
      password_fail = '';
    }
    notifyListeners();
  }

  void Password_Check_Check() {
    if (password.text == password_check.text) {
      password_check_status = true;
    } else {
      password_check_status = false;
    }
    Password_Check_Valid();
    notifyListeners();
  }

  void Password_Check_Valid() {
    if (!password_check_status) {
      password_check_fail = '비밀번호가 일치하지 않습니다.';
    } else {
      password_check_fail = '비밀번호가 일치합니다.';
    }
    notifyListeners();
  }

  void Password_Change() {
    password_check.text = '';
    notifyListeners();
  }

  void Agree_Check(String key) {
    agree[key] = !agree[key]!;
    if (agree.values.every((element) => element == true)) {
      entire = true;
    } else {
      entire = false;
    }
    notifyListeners();
  }

  void Birth_Check() {
    birth_status = utill.Birth_Isvalid(birth.text);
    if (!birth_status) {
      birth_fail = '생년월일이 올바르게 입력되지 않았습니다.';
    } else {
      birth_fail = '생년월일이 올바르게 입력되었습니다.';
    }
    notifyListeners();
  }

  void Select_Gender(String select) {
    gender = select;
    notifyListeners();
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
    notifyListeners();
  }

  Future<void> Join_Success() async {
    pass = false;
    if (email_status &&
        verification_code_status &&
        name_status &&
        nickname_status &&
        password_status &&
        password_check_status &&
        entire) {
      await Join();
    }
    notifyListeners();
  }

  Future<void> Join() async {
    bool success = await firebase.Join(email.text, password.text, name.text,
        nickname.text, gender, birth.text, entire);
    pass = success;
    notifyListeners();
  }
}
