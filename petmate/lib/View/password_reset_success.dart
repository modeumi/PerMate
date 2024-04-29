import 'package:flutter/material.dart';

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
        decoration: BoxDecoration(
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
                  child: Text('이메일 발송 완료'),
                ))
          ],
        ),
      ),
    );
  }
}
