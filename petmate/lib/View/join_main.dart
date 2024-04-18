import 'package:flutter/material.dart';
import 'package:petmate/Provider/join_provider.dart';
import 'package:petmate/View/join_success.dart';
import 'package:petmate/Widget/join/agree_field.dart';
import 'package:petmate/Widget/join/birth_field.dart';
import 'package:petmate/Widget/join/email_field.dart';
import 'package:petmate/Widget/join/gender_field.dart';
import 'package:petmate/Widget/join/name_field.dart';
import 'package:petmate/Widget/join/nickname_field.dart';
import 'package:petmate/Widget/join/password_check_field.dart';
import 'package:petmate/Widget/join/password_field.dart';
import 'package:petmate/Widget/push_button_a.dart';
import 'package:provider/provider.dart';

class JoinMain extends StatefulWidget {
  const JoinMain({super.key});

  @override
  State<JoinMain> createState() => _JoinMainState();
}

class _JoinMainState extends State<JoinMain> {
  @override
  Widget build(BuildContext context) {
    return Consumer<JoinProvider>(builder: (context, controller, child) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 100,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          title: Stack(
            children: [
              Positioned(
                top: 0,
                bottom: 0,
                left: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Image.asset('assets/onboarding/icon_5.png'),
                ),
              ),
              const Center(
                child: Text(
                  '회원가입',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/onboarding/Background.png'),
                    fit: BoxFit.fill),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const EmailField(),
                      const SizedBox(
                        height: 12,
                      ),
                      const NameField(),
                      const SizedBox(
                        height: 12,
                      ),
                      const NickNameField(),
                      const SizedBox(
                        height: 12,
                      ),
                      const PassWordField(),
                      const SizedBox(
                        height: 12,
                      ),
                      const PassWordCheckField(),
                      const SizedBox(
                        height: 12,
                      ),
                      const GenderField(),
                      const SizedBox(
                        height: 12,
                      ),
                      BrithField(),
                      const SizedBox(
                        height: 32,
                      ),
                      const AgreeField(),
                      PushButtonA(
                          content: '동의하고 회원가입',
                          action: () async {
                            await controller.Join_Success();
                            print(controller.pass);
                            if (controller.pass) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => JoinSuccess()));
                            }
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
