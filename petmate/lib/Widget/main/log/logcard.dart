import 'dart:ui';

import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class LogCard extends StatelessWidget {
  const LogCard({super.key, required this.Cardimg, required this.CardName});

  final String Cardimg;
  final String CardName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 288,
      height: 315,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 72,
            height: 72,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.8),
              border: GradientBoxBorder(
                width: 1,
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.2)
                  ],
                ),
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: BlurryContainer(
              blur: 12,
              elevation: 0,
              borderRadius: BorderRadius.circular(50),
              child: Container(),
            ),
          ),
          Opacity(
            opacity: 0.4,
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 2,
                      offset: Offset(4, 4),
                      spreadRadius: 0,
                    )
                  ],
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(50)),
            ),
          ),
          Positioned(
              left: 14,
              top: 14,
              child: Container(
                  width: 44, height: 44, child: Image.asset(Cardimg))),
          Positioned(
            left: 23,
            top: 80,
            child: Container(
              width: 25,
              height: 17,
              child: Text(
                CardName,
                style: White(14, FontWeight.w600),
              ),
            ),
          )
        ],
      ),
    );
  }
}
