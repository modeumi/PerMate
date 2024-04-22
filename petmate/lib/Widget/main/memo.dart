import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class MemoWidget extends StatefulWidget {
  const MemoWidget({super.key});

  @override
  State<MemoWidget> createState() => _MemoWidgetState();
}

class _MemoWidgetState extends State<MemoWidget> {
  bool state = false;
  bool state2 = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 108,
          margin: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: state2 ? Colors.white.withOpacity(0.2) : Colors.transparent,
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
          child: state2
              ? Container()
              : BlurryContainer(
                  blur: 12,
                  elevation: 0,
                  borderRadius: BorderRadius.circular(10),
                  child: Container(),
                ),
        ),
        Opacity(
          opacity: 0.4,
          child: Container(
            margin: EdgeInsets.all(8),
            width: double.infinity,
            height: 108,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 1,
                    offset: Offset(1, 1),
                    spreadRadius: 0,
                  )
                ],
                color: Color(0x3300287C),
                borderRadius: BorderRadius.circular(10)),
          ),
        ),
        Positioned(
          left: 25,
          top: 20,
          child: Text(
            '메모',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
        Positioned(
            left: 25,
            top: 57,
            child: Container(
              width: 4,
              height: 4,
              child: Image.asset(
                'assets/Main/Rectangle (1).png',
                color: Colors.white.withOpacity(0.6),
              ),
            )),
        Positioned(
          left: 35,
          top: 50,
          child: Text(
            '메모 작성시 표시됩니다.',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
            ),
          ),
        )
      ],
    );
  }
}
