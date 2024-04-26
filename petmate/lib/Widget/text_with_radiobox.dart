import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/join_controller.dart';

class TextWithRadio extends StatefulWidget {
  final int active;
  final int number;
  final String context;
  const TextWithRadio(
      {super.key,
      required this.active,
      required this.number,
      required this.context});

  @override
  State<TextWithRadio> createState() => _TextWithRadioState();
}

class _TextWithRadioState extends State<TextWithRadio> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<JoinController>(builder: (controller) {
      return GestureDetector(
        onTap: () {
          if (widget.active == 0) {
            controller.Entire_Click();
          } else {
            controller.Agree_Check('agree_${widget.active}');
          }
        },
        child: Row(
          children: [
            Image.asset(widget.active == 0
                ? controller.entire
                    ? 'assets/join/CheckFill_${widget.number}.png'
                    : 'assets/join/CheckBlank_${widget.number}.png'
                : controller.agree['agree_${widget.active}']!
                    ? 'assets/join/CheckFill_${widget.number}.png'
                    : 'assets/join/CheckBlank_${widget.number}.png'),
            SizedBox(
              width: widget.number == 1 ? 12 : 8,
            ),
            Text(
              widget.context,
              style: TextStyle(
                color: Colors.white,
                fontSize: widget.number == 1 ? 14 : 12,
                fontFamily: 'Pretendard',
                fontWeight:
                    widget.number == 1 ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      );
    });
  }
}
