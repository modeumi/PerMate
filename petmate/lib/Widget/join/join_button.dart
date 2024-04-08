import 'package:flutter/material.dart';
import 'package:petmate/Provider/join_provider.dart';
import 'package:provider/provider.dart';

class JoinButton extends StatefulWidget {
  const JoinButton({super.key});

  @override
  State<JoinButton> createState() => _JoinButtonState();
}

class _JoinButtonState extends State<JoinButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<JoinProvider>(builder: (context, controller, child) {
      return GestureDetector(
        onTap: () {
          controller.Join_Success();
        },
        child: Container(
          height: 48,
          margin: EdgeInsets.symmetric(vertical: 32),
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
              color: Color(0xFF1B6EEE),
              border: Border.all(
                width: 1,
                color: Colors.white.withOpacity(0.2),
              ),
              borderRadius: BorderRadius.circular(10)),
          child: Center(
            child: Text(
              '동의하고 회원가입',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      );
    });
  }
}
