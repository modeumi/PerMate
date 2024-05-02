import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class NotificationContainer1 extends StatefulWidget {
  const NotificationContainer1({super.key});

  @override
  State<NotificationContainer1> createState() => _NotificationContainer1State();
}

class _NotificationContainer1State extends State<NotificationContainer1> {
  bool state2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 10),
          child: Container(
            width: 36,
            height: 30,
            child: Text('오늘',
                textAlign: TextAlign.center, style: White(16, FontWeight.w600)),
          ),
        ),
        for (int i = 1; i < 4; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Stack(
              children: [
                Container(
                  width: 344,
                  height: 88,
                  margin: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: state2
                        ? Colors.white.withOpacity(0.2)
                        : Colors.transparent,
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
                    width: 344,
                    height: 88,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x26000000),
                            blurRadius: 2,
                            offset: Offset(2, 2),
                            spreadRadius: 0,
                          )
                        ],
                        color: Color(0x3300287C),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Positioned(
                  left: 12,
                  top: 12,
                  child: Container(
                    width: 115,
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/alert/note (20).png'),
                        Text('기록', style: White(14, FontWeight.w600)),
                        Opacity(
                          opacity: 0.6,
                          child: Text('·  오후 5:00',
                              style: White(10, FontWeight.w500)),
                        )
                      ],
                    ),
                  ),
                ),
                Positioned(
                    left: 17,
                    top: 38,
                    child: Text(
                        '‘공동육아’ 님이 ‘복실복실해’ 의 일지에 목욕기록을 남겼어요. \n 놓치지말고 확인해보세요!',
                        style: White(12, FontWeight.w500))),
              ],
            ),
          ),
      ],
    );
  }
}
