import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:petmate/Provider/login_provider.dart';
import 'package:petmate/View/join_main.dart';
import 'package:petmate/Widget/push_button_a.dart';
import 'package:petmate/Widget/question_to_push.dart';
import 'package:petmate/Widget/textfield_slot.dart';
import 'package:provider/provider.dart';

class LoginMain extends StatefulWidget {
  const LoginMain({super.key});

  @override
  State<LoginMain> createState() => _LoginMainState();
}

class _LoginMainState extends State<LoginMain> {
  bool status = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<LoginProvider>(builder: (context, provider, child) {
        return Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 42),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/onboarding/Background.png'),
                fit: BoxFit.fill),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: Image.asset('assets/onboarding/logo_2.png'),
                  ),
                ),
                TextFieldSlot(
                    hint: '이메일 (아이디)',
                    controller: provider.email,
                    status: provider.email_check,
                    action: () {},
                    password: false),
                SizedBox(
                  height: 8,
                ),
                Text(
                  provider.email_wrong,
                  style: TextStyle(
                    color: Color(0xFFFF000F),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 12,
                ),
                TextFieldSlot(
                  hint: '비밀번호 입력',
                  controller: provider.password,
                  status: provider.password_check,
                  action: () {},
                  password: status,
                  addwidget: GestureDetector(
                    onTap: () {
                      setState(() {
                        status = !status;
                      });
                    },
                    child: Icon(
                      status
                          ? CupertinoIcons.eye_slash_fill
                          : CupertinoIcons.eye_fill,
                      size: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  provider.password_wrong,
                  style: TextStyle(
                    color: Color(0xFFFF000F),
                    fontSize: 12,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 28,
                ),
                QuestionToPush(
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
                SizedBox(
                  height: 12,
                ),
                QuestionToPush(
                  question: '비밀번호를 잊어버리셨나요?',
                  pushtext: '비밀번호 찾기',
                  action: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => const JoinMain(),
                    //   ),
                    // );
                  },
                ),
                SizedBox(
                  height: 25,
                ),
                PushButtonA(
                  content: '로그인',
                  action: () async {
                    bool status = await provider.Login();
                    if (status) {
                      print('정상 확인');
                    }
                  },
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
