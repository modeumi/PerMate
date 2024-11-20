import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/join_controller.dart';
import 'package:petmate/Widget/check_button.dart';
import 'package:petmate/Widget/textfield_slot.dart';

class EmailField extends StatefulWidget {
  const EmailField({super.key});

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JoinController>(builder: (controller) {
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
                    controller: controller.email,
                    status: controller.email_checker,
                    action: () {
                      controller.Email_Changer();
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
                          controller.Email_Check();
                        },
                        content: controller.mailsend ? '재전송' : '인증 요청'))
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
                    controller: controller.verification_code,
                    status: controller.verification_code_checker,
                    action: () {
                      controller.Verification_Code_Changer();
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
                          controller.Verification_Code_Check();
                        },
                        content: '확인'))
              ],
            ),
            const SizedBox(
              height: 7,
            ),
            Text(
              controller.email_fail,
              style: TextStyle(
                color: controller.email_checker
                    ? controller.verification_code_checker
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
