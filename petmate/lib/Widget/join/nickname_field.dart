import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/join_controller.dart';
import 'package:petmate/Widget/check_button.dart';
import 'package:petmate/Widget/textfield_slot.dart';

class NickNameField extends StatefulWidget {
  const NickNameField({super.key});

  @override
  State<NickNameField> createState() => _NickNameFieldState();
}

class _NickNameFieldState extends State<NickNameField> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JoinController>(builder: (controller) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '닉네임',
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
              children: [
                Flexible(
                  flex: 3,
                  child: TextFieldSlot(
                    hint: '2~16자 이내로 입력해주세요',
                    controller: controller.nickname,
                    status: controller.nickname_checker,
                    action: () {
                      controller.NickName_Changer();
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
                        controller.NickName_Check();
                      },
                      content: '중복 확인'),
                )
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              controller.nickname_fail,
              style: TextStyle(
                color: controller.nickname_checker
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
