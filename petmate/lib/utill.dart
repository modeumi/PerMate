class Utill {
  bool Password_Isvalid(String password) {
    bool lower = password.contains(RegExp(r'[a-z]'));
    bool upper = password.contains(RegExp(r'[A-Z]'));
    bool special = password.contains(RegExp(r'[!@#]'));
    bool digit = password.contains(RegExp(r'[0-9]'));
    bool length = password.length >= 8 && password.length <= 20;

    int count = 0;
    if (lower) count++;
    if (upper) count++;
    if (special) count++;
    if (digit) count++;

    return count >= 2 && length;
  }

  bool Email_Isvalid(String email) {
    bool sign = email.contains('@');

    return sign;
  }

  bool Name_Isvalid(String name) {
    return RegExp(r'^[가-힣a-zA-Z]+$').hasMatch(name);
  }

  bool NickName_Isvalid(String name) {
    return RegExp(r'^[가-힣a-zA-Z1-9]+$').hasMatch(name);
  }

  bool Birth_Isvalid(String birth) {
    return RegExp(r'^\d{4}\.\d{2}\.\d{2}$').hasMatch(birth);
  }
}
