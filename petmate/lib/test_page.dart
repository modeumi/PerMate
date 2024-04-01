import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart';

class Test_Page extends StatefulWidget {
  const Test_Page({super.key});

  @override
  State<Test_Page> createState() => _Test_PageState();
}

class _Test_PageState extends State<Test_Page> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> join_input(String email, String password) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      // 사용자 등록 후 uid 가져오기
      String uid = userCredential.user!.uid;
      // 여기는 단순 데이터베이스 (store)
      return uid;
    } catch (e) {
      print('에러 : $e');
      return 'false';
    }
  }

  Future<void> Kakao_login() async {
    // bool isInstalled = await isKakaoTalkInstalled();
    try {
      print('진입');
      OAuthToken token = await UserApi.instance.loginWithKakaoAccount();
      print('진입2');
      print('카카오계정으로 로그인 성공 ${token.accessToken}');
    } catch (e) {
      print('카카오계정으로 로그인 실패! $e');
    }
    // OAuthToken token =
    // isInstalled
    //     ? await UserApi.instance.loginWithKakaoTalk()
    //     : await UserApi.instance.loginWithKakaoAccount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const Text('테스트 페이지'),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.amber),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 3,
                    child: GestureDetector(
                      onTap: () async {
                        String result =
                            await join_input('modeumi-@naver.com', 'qwe123!@');
                        print('성공?');
                        print(result);
                      },
                      child: Container(
                        decoration: const BoxDecoration(color: Colors.black),
                      ),
                    ),
                  ),
                  Expanded(
                      flex: 3,
                      child: GestureDetector(
                        onTap: () async {
                          await Kakao_login();
                        },
                        child: Container(
                          decoration: const BoxDecoration(color: Colors.amber),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
