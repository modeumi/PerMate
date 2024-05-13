import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class MemoWriteWidget extends StatefulWidget {
  const MemoWriteWidget({super.key});

  @override
  State<MemoWriteWidget> createState() => _MemoWriteWidgetState();
}

class _MemoWriteWidgetState extends State<MemoWriteWidget> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 108,
          margin: EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: state ? Colors.white.withOpacity(0.2) : Colors.transparent,
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
          child: state
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
          left: 18,
          top: 16,
          child: Text('메모', style: White(12, FontWeight.w500)),
        ),
        Positioned(
          top: 42,
          left: 20,
          child: Container(
            width: 124,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 4,
                  height: 4,
                  child: Image.asset(
                    'assets/Main/Rectangle (1).png',
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
                Opacity(
                    opacity: 0.6,
                    child: Text('메모 작성시 표시됩니다.',
                        style: White(12, FontWeight.w500))),
              ],
            ),
          ),
        )
      ],
    );
  }
}
