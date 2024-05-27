import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class WalkWidget extends StatefulWidget {
  const WalkWidget({super.key});

  @override
  State<WalkWidget> createState() => _WalkWidgetState();
}

class _WalkWidgetState extends State<WalkWidget> {
  bool state = false;
  bool state2 = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 168,
          height: 64,
         margin: EdgeInsets.fromLTRB(3, 0, 3, 3),
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
            margin: EdgeInsets.all(4),
            width: 168,
            height: 64,
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
          left: 36,
          top: 16,
          child: Container(
            width: 88,
            height: 32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/Main/walk.png'),
                Text('산책 하기',
                    textAlign: TextAlign.center,
                    style: White(12, FontWeight.w500)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
