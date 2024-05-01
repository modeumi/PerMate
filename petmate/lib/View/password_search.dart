import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:petmate/DataTools/firebase.dart';
import 'package:petmate/Controller/password_controller.dart';
import 'package:petmate/View/password_reset_success.dart';

import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/passwordsearch/email_field.dart';
import 'package:petmate/Widget/passwordsearch/name_field.dart';
import 'package:petmate/Widget/push_button_a.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  FirebaseData firebase = FirebaseData();
  @override
  Widget build(BuildContext context) {
    Get.put(PasswordController());
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppbar(title: '비밀번호 찾기'),
      body: GetBuilder<PasswordController>(
        builder: (controller) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 42),
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/onboarding/Background.png'),
                  fit: BoxFit.fill),
            ),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const NameField(),
                    const EmailField(),
                    PushButtonA(
                      content: '다음',
                      action: () async {
                        controller.Code_Check();
                        if (controller.code_status) {
                          bool result = await firebase.Change_Password(
                              controller.email.text);
                          if (result) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PasswordResetSuccess(),
                              ),
                            );
                          }
                        }
                      },
                      active: (controller.info_check &&
                          controller.verification.text != ''),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
