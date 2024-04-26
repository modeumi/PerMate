import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:petmate/DataTools/firebase.dart';
import 'package:petmate/Provider/password_provider.dart';

import 'package:petmate/Widget/custom_appbar.dart';

class PasswordSearch extends StatefulWidget {
  const PasswordSearch({super.key});

  @override
  State<PasswordSearch> createState() => _PasswordSearchState();
}

class _PasswordSearchState extends State<PasswordSearch> {
  FirebaseData firebase = FirebaseData();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppbar(title: '비밀번호 찾기'),
      body: Consumer<PasswordProvider>(
        builder: (context, provider, child) {
          print('불리언 체크');
          print(provider.info_check);
          print(provider.code_check);
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
                        provider.Code_Check();
                        if (provider.code_status) {
                          bool result = await firebase.Change_Password(
                              provider.email.text);
                          if (result) {
                            // Navigator.push(context,
                            //     MaterialPageRoute(builder: (context) => JoinSuccess()));
                          }
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
