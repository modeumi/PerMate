import 'package:flutter/material.dart';
import 'package:petmate/Provider/join_provider.dart';
import 'package:petmate/Widget/textfield_slot.dart';
import 'package:provider/provider.dart';

class NameField extends StatefulWidget {
  const NameField({super.key});

  @override
  State<NameField> createState() => _NameFieldState();
}

class _NameFieldState extends State<NameField> {
  @override
  Widget build(BuildContext context) {
    return Consumer<JoinProvider>(builder: (context, provider, child) {
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
              controller: provider.name,
              status: provider.name_checker,
              action: () {
                provider.Name_Changer();
                provider.Name_Check();
              },
              password: false,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              provider.name_fail,
              style: TextStyle(
                color: provider.name_checker ? Colors.white : Color(0xFFFF0000),
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
