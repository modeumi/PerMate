import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        height: 100,
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
                Flexible(
                  flex: 5,
                  child: PushButtonB(
                      content: '남성',
                      action: () {
                        provider.Select_Gender('남성');
                      }),
                ),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  flex: 5,
                  child: PushButtonB(
                      content: '여성',
                      action: () {
                        provider.Select_Gender('여성');
                      }),
                )
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
