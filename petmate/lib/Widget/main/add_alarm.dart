import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class AlarmWidget extends StatefulWidget {
  const AlarmWidget({super.key});

  @override
  State<AlarmWidget> createState() => _AlarmWidgetState();
}

class _AlarmWidgetState extends State<AlarmWidget> {
  bool state = false;
  bool state2 = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 168,
          height: 64,
          margin: EdgeInsets.all(1),
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
            margin: EdgeInsets.all(3),
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
            left: 35, top: 18, child: Image.asset('assets/Main/alarm.png')),
        Positioned(
          left: 75,
          top: 25,
          child: Text(
            '알람 추가',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
