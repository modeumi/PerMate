import 'package:flutter/material.dart';
import 'package:petmate/Provider/join_provider.dart';
import 'package:petmate/Widget/textfield_slot.dart';
import 'package:provider/provider.dart';

class PassWordField extends StatefulWidget {
  const PassWordField({super.key});

  @override
  State<PassWordField> createState() => _PassWordFieldState();
}

class _PassWordFieldState extends State<PassWordField> {
  @override
  Widget build(BuildContext context) {
    return Consumer<JoinProvider>(builder: (context, provider, child) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '비밀번호',
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextFieldSlot(
              hint: '영문/숫자/특수문자 혼합 8~20자',
              controller: provider.password,
              status: provider.password_checker,
              action: () {
                provider.Password_Check();
                provider.Password_Changer();
              },
              password: true,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              provider.password_fail,
              style: TextStyle(
                color: provider.password_checker
                    ? Colors.white
                    : Color(0xFFFF0000),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
                height: 0,
              ),
            )
          ],
        ),
      );
    });
  }
}
