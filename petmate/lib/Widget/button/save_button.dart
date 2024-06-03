import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class SaveButtonWidget extends StatefulWidget {
  const SaveButtonWidget({super.key});

  @override
  State<SaveButtonWidget> createState() => _SaveButtonWidgetState();
}

class _SaveButtonWidgetState extends State<SaveButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 320,
          height: 40,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Color(0xFF2B80FF),
            border: GradientBoxBorder(
              width: 1,
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.2)
                ],
              ),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: BlurryContainer(
            blur: 12,
            elevation: 0,
            borderRadius: BorderRadius.circular(10),
            child: Container(),
          ),
        ),
        Opacity(
          opacity: 0.8,
          child: Container(
            margin: EdgeInsets.all(8),
            width: 320,
            height: 40,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 2,
                    offset: Offset(0, 2),
                    spreadRadius: 0,
                  )
                ],
                color: Color(0xFF2B80FF),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        Positioned(
          left: 155,
          top: 15,
          child: Text(
            '저장',
            style: White(16, FontWeight.w600),
          ),
        )
      ],
    );
  }
}
