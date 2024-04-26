import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';
import 'package:petmate/DataTools/firebase.dart';

class KakaoLogin {
  FirebaseData firebase = FirebaseData();

  Future<Map<String, String>> Kakao_login() async {
    // if (await isKakaoTalkInstalled()) {
    try {
      print('들어옴');
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
        await firebase.Join(
            user.kakaoAccount!.email!,
            user.id.toString(),
            user.kakaoAccount!.name!,
            user.kakaoAccount!.name!,
            gender,
            birth,
            true);
      }
      return {
        'email': user.kakaoAccount!.email!,
        'password': user.id.toString()
      };
    } catch (error) {
      print('카카오톡으로 로그인 실패 $error');
      return {};
    }
  }
}
