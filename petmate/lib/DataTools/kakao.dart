import 'package:flutter/services.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:petmate/DataTools/firebase.dart';

class KakaoLogin {
  FirebaseData firebase = FirebaseData();

  Future<bool> Kakao_login() async {
    if (await isKakaoTalkInstalled()) {
      try {
        OAuthToken token = await UserApi.instance.loginWithKakaoTalk();
        User user = await UserApi.instance.me();
        bool check =
            await firebase.Duplication_Check_Email(user.kakaoAccount!.email!);

        if (check) {
          String gender = '';
          if (user.kakaoAccount!.gender! == Gender.male) {
            gender = '남성';
          } else {
            gender = '여성';
          }
          String birth =
              '${user.kakaoAccount!.birthyear}.${user.kakaoAccount!.birthday!.substring(0, 2)}.${user.kakaoAccount!.birthday!.substring(2)}';
          bool join = await firebase.Join(
              user.kakaoAccount!.email!,
              user.id.toString(),
              user.kakaoAccount!.name!,
              user.kakaoAccount!.name!,
              gender,
              birth,
              true);
          return join;
        }
        return !check;
      } catch (error) {
        print('카카오톡으로 로그인 실패 $error');
        if (error is PlatformException && error.code == 'CANCELED') {
          return false;
        }
        try {
          await UserApi.instance.loginWithKakaoAccount();
          print('카카오계정으로 로그인 성공');
        } catch (error) {
          print('카카오계정으로 로그인 실패 $error');
        }
        return false;
      }
    } else {
      try {
        await UserApi.instance.loginWithKakaoAccount();
        print('카카오계정으로 로그인 성공');
      } catch (error) {
        print('카카오계정으로 로그인 실패 $error');
      }
      return false;
    }
  }
}
