import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/password_controller.dart';
import 'package:petmate/Widget/textfield_slot.dart';

class NameField extends StatefulWidget {
  const NameField({super.key});

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<PasswordController>(builder: (controller) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '이름',
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
              hint: '이름을 입력해주세요',
              controller: controller.name,
              status: controller.info_check,
              action: () {
                // controller.Check_Statue();
                controller.Info_Changer();
              },
              password: false,
            ),
            SizedBox(
              height: 24,
            ),
          ],
        ),
      );
    });
  }
}
