import 'package:flutter/material.dart';
import 'package:petmate/DataTools/kakao.dart';
import 'package:petmate/Provider/login_provider.dart';
import 'package:petmate/View/join_main.dart';
import 'package:petmate/View/login_main.dart';
import 'package:petmate/Widget/login_button.dart';
import 'package:petmate/Widget/question_to_push.dart';
import 'package:provider/provider.dart';

class LoginSelect extends StatefulWidget {
  const LoginSelect({super.key});

  @override
  State<LoginSelect> createState() => _LoginSelectState();
}

class _LoginSelectState extends State<LoginSelect> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginProvider>(builder: (context, provider, child) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/onboarding/Background.png'),
                fit: BoxFit.fill),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '반려인을 위한 모든것',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Opacity(
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
              const SizedBox(
                height: 80,
              ),
              Image.asset('assets/onboarding/image_1.png'),
              const SizedBox(
                height: 20,
              ),
              LoginButton(
                color: const Color(0xFFFEE500),
                image: 'assets/onboarding/kakaotalk_bubble.png',
                contenct: '카카오 로그인',
                event: () async {
                  Map<String, String> result = await KakaoLogin().Kakao_login();
                  if (result.isNotEmpty) {
                    provider.KaKao_Login(result);
                    print('성공');
                  } else {
                    print('실패');
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              LoginButton(
                color: const Color(0xFFFFFFFF),
                image: 'assets/onboarding/icon_2.png',
                contenct: '이메일 로그인',
                event: () {
                  provider.Reset();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginMain(),
                      ));
                },
              ),
              const SizedBox(
                height: 62,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60.0),
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
            ],
          ),
        );
      }),
    );
  }
}
