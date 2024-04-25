import 'package:flutter/material.dart';
import 'package:petmate/Provider/password_provider.dart';
import 'package:petmate/Widget/custom_appbar.dart';
import 'package:petmate/Widget/passwordsearch/email_field.dart';
import 'package:petmate/Widget/passwordsearch/name_field.dart';
import 'package:petmate/Widget/push_button_a.dart';
import 'package:provider/provider.dart';

class PasswordSearch extends StatefulWidget {
  const PasswordSearch({super.key});

  @override
  State<PasswordSearch> createState() => _PasswordSearchState();
}

class _PasswordSearchState extends State<PasswordSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppbar(title: '비밀번호 찾기'),
      body: Consumer<PasswordProvider>(
        builder: (context, provider, child) {
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
                      action: () {
                        provider.Code_Check();
                        if (provider.code_status) {
                          print('승인');
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => JoinSuccess()));
                        }
                      },
                      //
                      active: (provider.info_check &&
                          provider.verification.text != ''),
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
