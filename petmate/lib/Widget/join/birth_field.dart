import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/join_controller.dart';
import 'package:petmate/Widget/textfield_slot.dart';

class BrithField extends StatefulWidget {
  const BrithField({super.key});

  @override
  State<BrithField> createState() => _BrithFieldState();
}

class _BrithFieldState extends State<BrithField> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JoinController>(builder: (controller) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '생년월일',
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
              hint: 'YYYY.MM.DD',
              controller: controller.birth,
              status: controller.birth_checker,
              action: () {
                controller.Birth_Check();
              },
              password: false,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              controller.birth_fail,
              style: TextStyle(
                color:
                    controller.birth_checker ? Colors.white : Color(0xFFFF0000),
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
