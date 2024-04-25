import 'package:flutter/material.dart';
import 'package:petmate/Provider/join_provider.dart';
import 'package:petmate/Widget/push_button_b.dart';
import 'package:provider/provider.dart';

class GenderField extends StatefulWidget {
  const GenderField({super.key});

  @override
  State<GenderField> createState() => _GenderFieldState();
}

class _GenderFieldState extends State<GenderField> {
  @override
  Widget build(BuildContext context) {
    return Consumer<JoinProvider>(builder: (context, provider, child) {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              '성별',
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
                for (String key in provider.gender_list)
                  Flexible(
                    flex: 5,
                    child: Container(
                      margin: EdgeInsets.only(
                          right: provider.gender_list.indexOf(key) !=
                                  provider.gender_list.length - 1
                              ? 8
                              : 0),
                      child: PushButtonB(
                        content: key,
                        action: () {
                          provider.Select_Gender(key);
                        },
                        condition: provider.gender == key,
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              ' ',
              style: TextStyle(
                color: provider.name_status ? Colors.white : Color(0xFFFF0000),
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
