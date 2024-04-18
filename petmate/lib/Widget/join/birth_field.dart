import 'package:flutter/material.dart';
import 'package:petmate/Provider/join_provider.dart';
import 'package:petmate/Widget/textfield_slot.dart';
import 'package:provider/provider.dart';

class BrithField extends StatefulWidget {
  const BrithField({super.key});

  @override
  State<BrithField> createState() => _BrithFieldState();
}

class _BrithFieldState extends State<BrithField> {
  @override
  Widget build(BuildContext context) {
    return Consumer<JoinProvider>(builder: (context, provider, child) {
      return Container(
        height: 100,
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
              controller: provider.birth,
              status: provider.birth_status,
              action: () {
                provider.Birth_Check();
              },
              password: false,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              provider.birth_fail,
              style: TextStyle(
                color: provider.birth_status ? Colors.white : Color(0xFFFF0000),
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
