import 'package:flutter/material.dart';
import 'package:petmate/Provider/join_provider.dart';
import 'package:petmate/Widget/check_button.dart';
import 'package:petmate/Widget/textfield_slot.dart';
import 'package:provider/provider.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return Consumer<JoinProvider>(builder: (context, provider, child) {
      return Container(
        height: 150,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '이메일 (아이디)',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: TextFieldSlot(
                    hint: 'example@example.com',
                    controller: provider.email,
                    status: provider.email_checker,
                    action: () {
                      provider.Email_Changer();
                    },
                    password: false,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                    flex: 1,
                    child: CheckButton(
                        event: () {
                          provider.Email_Check();
                        },
                        content: provider.mailsend ? '재전송' : '인증 요청'))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 3,
                  child: TextFieldSlot(
                    hint: '인증번호를 입력해주세요',
                    controller: provider.verification_code,
                    status: provider.verification_code_checker,
                    action: () {
                      provider.Verification_Code_Changer();
                    },
                    password: false,
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                    flex: 1,
                    child: CheckButton(
                        event: () {
                          provider.Verification_Code_Check();
                        },
                        content: '확인'))
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              Provider.of<JoinProvider>(context, listen: false).email_fail,
              style: TextStyle(
                color: provider.email_checker
                    ? provider.verification_code_checker
                        ? Colors.white
                        : Color(0xFFFF0000)
                    : Color(0xFFFF0000),
                fontSize: 12,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    });
  }
}
