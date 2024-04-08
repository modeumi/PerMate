import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:petmate/Api/firebase.dart';
import 'package:petmate/utill.dart';

class JoinProvider extends ChangeNotifier {
  FirebaseData firebase = FirebaseData();

  TextEditingController email = TextEditingController();
  TextEditingController verification_code = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController nickname = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController password_check = TextEditingController();

  Utill utill = Utill();

  bool email_status = true;
  bool verification_code_status = true;
  bool name_status = true;
  bool nickname_status = true;
  bool password_status = true;
  bool password_check_status = true;
  bool pass = false;

  String email_fail = '';
  String verification_code_fail = '';
  String name_fail = '';
  String nickname_fail = '';
  String password_fail = '';
  String password_check_fail = '';

  bool entire = false;
  Map<String, bool> agree = {
    'agree_1': false,
    'agree_2': false,
    'agree_3': false,
    'agree_4': false
  };

  void Email_Check() {
    if (email.text != '' && utill.Email_Isvalid(email.text)) {
      email_status = true;
    } else {
      email_status = false;
    }
    Email_Valid();
    notifyListeners();
  }

  void Email_Valid() {
    if (!email_status) {
      email_fail = '이미 등록된 아이디입니다';
    } else {
      email_fail = '';
    }
    notifyListeners();
  }

  void Verification_Code_Check() {
    if (verification_code.text != '') {
      verification_code_status = true;
    } else {
      verification_code_status = false;
    }
    notifyListeners();
  }

  void Verification_Code_Valid() {
    if (!verification_code_status) {
      verification_code_fail = '인증번호가 일치하지 않습니다.';
    } else {
      verification_code_fail = '';
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
      password_check_fail = '';
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

  void Join_Success() {
    if (email_status &&
        verification_code_status &&
        name_status &&
        nickname_status &&
        password_status &&
        password_check_status) {
      pass = true;
    } else {
      pass = false;
    }
    Join();
  }

  Future<void> Join() async {
    if (pass) {
      print('눌러');
      bool success = await firebase.Join(
          email.text, password.text, name.text, nickname.text, entire);
      if (success) {
        print('가입완료');
        // Navigator.push(context, MaterialPageRoute(builder: (context) => ,));
      }
    }
  }
}
