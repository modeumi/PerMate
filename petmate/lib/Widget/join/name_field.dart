import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/join_controller.dart';
import 'package:petmate/Widget/textfield_slot.dart';

class NameField extends StatefulWidget {
  const NameField({super.key});

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JoinController>(builder: (controller) {
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
              status: controller.name_checker,
              action: () {
                controller.Name_Changer();
                controller.Name_Check();
              },
              password: false,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              controller.name_fail,
              style: TextStyle(
                color:
                    controller.name_checker ? Colors.white : Color(0xFFFF0000),
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
