import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:petmate/DataTools/google_smtp.dart';
import 'package:petmate/util.dart';

class PasswordProvider with ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController verification = TextEditingController();
  Utility util = Utility();
  String code = '';
  Timer? timer;

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
    bool email_valid = util.Email_Isvalid(email.text);
    if (email_valid) {
      Create_Code();
      await MailSender().SearchEmailSend(email.text, code);
    }
    // if()
  }
}
