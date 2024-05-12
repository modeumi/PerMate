import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/push_button_a.dart';

class PasswordResetSuccess extends StatefulWidget {
  const PasswordResetSuccess({super.key});

  @override
  State<PasswordResetSuccess> createState() => _PasswordResetSuccessState();
}

class _PasswordResetSuccessState extends State<PasswordResetSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/onboarding/Background.png'),
                fit: BoxFit.fill)),
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                top: MediaQuery.sizeOf(context).height * 0.25,
                child: Center(
                  child: Text(
                    '이메일 발송 완료',
                    style: White(28, FontWeight.w800),
                  ),
                )),
            Center(
              child: Image.asset('assets/onboarding/mail.png'),
            ),
            Positioned(
                left: 0,
                right: 0,
                bottom: MediaQuery.sizeOf(context).height * 0.15,
                child: Text(
                  '비밀번호를 재설정할 이메일을 발송했어요.\n이제 다시 로그인 해볼까요?',
                  textAlign: TextAlign.center,
                  style: White(16, FontWeight.w600),
                )),
            Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: PushButtonA(
                      content: '로그인하기',
                      action: () {
                        Get.offAllNamed('/login');
                      }),
                ))
          ],
        ),
      ),
    );
  }
}
