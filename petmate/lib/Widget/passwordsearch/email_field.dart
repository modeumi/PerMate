import 'package:flutter/material.dart';
import 'package:petmate/Provider/password_provider.dart';
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
    return Consumer<PasswordProvider>(builder: (context, provider, child) {
      return Container(
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
                    status: provider.info_check,
                    action: () {
                      provider.Info_Changer();
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
                        content: provider.mail_send ? '재전송' : '인증 요청'))
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            TextFieldSlot(
              hint: '인증번호를 입력해주세요',
              controller: provider.verification,
              status: provider.code_check,
              action: () {
                //
              },
              password: false,
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              provider.invaild_info,
              style: TextStyle(
                color: provider.info_check
                    ? provider.code_check
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
