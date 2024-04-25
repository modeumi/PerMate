import 'package:flutter/material.dart';
import 'package:petmate/Provider/join_provider.dart';
import 'package:petmate/Widget/textfield_slot.dart';
import 'package:provider/provider.dart';

class PassWordCheckField extends StatefulWidget {
  const PassWordCheckField({super.key});

  @override
  State<PassWordCheckField> createState() => _PassWordFieldState();
}

class _PassWordFieldState extends State<PassWordCheckField> {
  @override
  Widget build(BuildContext context) {
    return Consumer<JoinProvider>(builder: (context, provider, child) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '비밀번호 확인',
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
              hint: '비밀번호를 한번 더 입력해주세요',
              controller: provider.password_check,
              status: provider.password_check_checker,
              action: () {
                provider.Password_Check_Check();
              },
              password: true,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              provider.password_check_fail,
              style: TextStyle(
                color: provider.password_check_checker
                    ? Colors.white
                    : Color(0xFFFF0000),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      );
    });
  }
}
