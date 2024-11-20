import 'package:flutter/material.dart';
import 'package:petmate/View/login_main.dart';
import 'package:petmate/Util/textstyles.dart';

class JoinSuccess extends StatefulWidget {
  const JoinSuccess({super.key});

  @override
  State<JoinSuccess> createState() => _JoinSuccessState();
}

class _JoinSuccessState extends State<JoinSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/onboarding/Background.png'),
              fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '회원가입 완료', // 28 800
                    style: White(28, FontWeight.w800),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Text('환영해요!', style: White(16, FontWeight.w600)),
                  const SizedBox(
                    height: 48,
                  ),
                  SizedBox(
                      width: 160,
                      height: 160,
                      child: Image.asset(
                        'assets/onboarding/image_2.png',
                        fit: BoxFit.fill,
                      ))
                ],
              ),
            ),
            Text('이제 로그인하고 \n펫메이트를 시작해봐요!',
                textAlign: TextAlign.center, style: White(16, FontWeight.w600)),
            GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginMain()));
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  decoration: BoxDecoration(
                      color: const Color(0x3300287C),
                      border: Border.all(
                        width: 1,
                        color: Colors.white.withOpacity(0.2),
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        const BoxShadow(
                          color: Color(0x4C000000),
                          blurRadius: 10,
                          offset: Offset(2, 2),
                        )
                      ]),
                  margin: const EdgeInsets.fromLTRB(20, 40, 20, 30),
                  child: Text(
                    '로그인하기',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
