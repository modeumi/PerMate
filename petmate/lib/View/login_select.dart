import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petmate/DataTools/kakao.dart';
import 'package:petmate/Controller/login_controller.dart';
import 'package:petmate/View/join_main.dart';
import 'package:petmate/View/login_main.dart';
import 'package:petmate/Widget/login_button.dart';
import 'package:petmate/Widget/question_to_push.dart';

class LoginSelect extends StatefulWidget {
  const LoginSelect({super.key});

  @override
  State<LoginSelect> createState() => _LoginSelectState();
}

class _LoginSelectState extends State<LoginSelect> {
  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      body: GetBuilder<LoginController>(builder: (controller) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/onboarding/Background.png'),
                fit: BoxFit.fill),
          ),
          child: Stack(
            children: [
              Positioned(
                top: MediaQuery.sizeOf(context).height * 0.19,
                left: 0,
                right: 0,
                child: const Center(
                  child: Text(
                    '반려인을 위한 모든것',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.sizeOf(context).height * 0.25,
                left: 0,
                right: 0,
                child: const Center(
                  child: Opacity(
                    opacity: 0.80,
                    child: Text(
                      '펫메이트와 함께 해보세요!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                  left: 0,
                  right: 0,
                  top: MediaQuery.sizeOf(context).height * 0.361,
                  child: Center(
                      child: Image.asset('assets/onboarding/image_1.png'))),
              Positioned(
                bottom: MediaQuery.sizeOf(context).height * 0.29,
                left: 0,
                right: 0,
                child: LoginButton(
                  color: const Color(0xFFFEE500),
                  image: 'assets/onboarding/kakaotalk_bubble.png',
                  contenct: '카카오 로그인',
                  event: () async {
                    print('카카오');
                    Map<String, String> result =
                        await KakaoLogin().Kakao_login();
                    if (result.isNotEmpty) {
                      bool login = await controller.KaKao_Login(result);
                      print('성공');
                      if (login) {
                        Get.toNamed('/main');
                      }
                    } else {
                      print('실패');
                    }
                  },
                ),
              ),
              Positioned(
                bottom: MediaQuery.sizeOf(context).height * 0.21,
                left: 0,
                right: 0,
                child: LoginButton(
                  color: const Color(0xFFFFFFFF),
                  image: 'assets/onboarding/icon_2.png',
                  contenct: '이메일 로그인',
                  event: () {
                    controller.Reset();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginMain(),
                        ));
                  },
                ),
              ),
              Positioned(
                bottom: MediaQuery.sizeOf(context).height * 0.1,
                left: 0,
                right: 0,
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.sizeOf(context).width * 0.14),
                  child: Center(
                    child: QuestionToPush(
                      question: '아직 펫메이트 계정이 없다면?',
                      pushtext: '회원가입',
                      action: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const JoinMain(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
