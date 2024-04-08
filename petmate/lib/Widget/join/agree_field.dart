import 'package:flutter/material.dart';
import 'package:petmate/Provider/join_provider.dart';
import 'package:petmate/Widget/text_with_radiobox.dart';
import 'package:provider/provider.dart';

class AgreeField extends StatefulWidget {
  const AgreeField({super.key});

  @override
  State<AgreeField> createState() => _AgreeFieldState();
}

class _AgreeFieldState extends State<AgreeField> {
  @override
  Widget build(BuildContext context) {
    return Consumer<JoinProvider>(builder: (context, controller, child) {
      return Container(
        child: Column(
          children: [
            const TextWithRadio(active: 0, number: 1, context: '모두 동의합니다.'),
            const SizedBox(
              height: 8,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(10)),
              padding: const EdgeInsets.all(8),
              child: const Column(
                children: [
                  TextWithRadio(
                      active: 1, number: 2, context: '개인정보 처리방침 동의 (필수)'),
                  SizedBox(
                    height: 12,
                  ),
                  TextWithRadio(
                      active: 2, number: 2, context: '위치 기반 서비스 동의 (필수)'),
                  SizedBox(
                    height: 12,
                  ),
                  TextWithRadio(
                      active: 3, number: 2, context: '서비스 이용약관 동의 (필수)'),
                  SizedBox(
                    height: 12,
                  ),
                  TextWithRadio(
                      active: 4, number: 2, context: '청소년 보호정책 동의 (필수)'),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
