import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Widget/notice/notification_container.dart';
import 'package:petmate/Widget/notice/notificationcontainer2.dart';

class SelectWeekWidget extends StatefulWidget {
  const SelectWeekWidget({super.key});

  @override
  State<SelectWeekWidget> createState() => _SelectWeekWidgetState();
}

class _SelectWeekWidgetState extends State<SelectWeekWidget> {
  int button = -1;
  final List<String> week = [
    '일',
    '월',
    '화',
    '수',
    '목',
    '금',
    '토',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              7,
              (index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        if (button == index) {
                        } else {
                          button = index;
                        }
                      });
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: 36,
                          height: 36,
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: button == index
                                ? Colors.white.withOpacity(0.8)
                                : Colors.white.withOpacity(0.1),
                            border: GradientBoxBorder(
                              width: 1,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.5),
                                  Colors.white.withOpacity(0.2)
                                ],
                              ),
                            ),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: button == index
                              ? Container()
                              : BlurryContainer(
                                  blur: 12,
                                  elevation: 0,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(),
                                ),
                        ),
                        Opacity(
                          opacity: 0.4,
                          child: Container(
                            margin: EdgeInsets.all(3),
                            width: 36,
                            height: 36,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x26000000),
                                    blurRadius: 2,
                                    offset: Offset(0, 2),
                                    spreadRadius: 0,
                                  )
                                ],
                                color: Color(0x3300287C),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        Positioned(
                          left: 2,
                          top: 8,
                          child: Container(
                            width: 36,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  week[index],
                                  style: TextStyle(
                                    color: button == index
                                        ? Color(0xFF303030)
                                        : Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ))),
    );
  }
}
