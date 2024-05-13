import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Widget/notice/notification_container.dart';
import 'package:petmate/Widget/notice/notificationcontainer2.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  int button = -1;
  final List<String> text = ['기록', '정보', '거래', '모임'];
  final image = [
    'assets/alert/note (16).png',
    'assets/alert/information(16).png',
    'assets/alert/trade(16).png',
    'assets/alert/group(16).png',
  ];

  final Changeimage = [
    'assets/alert/note_selected.png',
    'assets/alert/information_selected.png',
    'assets/alert/trade_selected.png',
    'assets/alert/group_selected.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 344,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
              4,
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
                          width: 80,
                          height: 40,
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
                            width: 80,
                            height: 40,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x26000000),
                                    blurRadius: 4,
                                    offset: Offset(4, 4),
                                    spreadRadius: 0,
                                  )
                                ],
                                color: Color(0x3300287C),
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ),
                        Positioned(
                          left: 16,
                          top: 13,
                          child: Container(
                            width: 48,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Image.asset(button == index
                                    ? Changeimage[index]
                                    : image[index]),
                                Text(
                                  text[index],
                                  style: TextStyle(
                                    color: button == index
                                        ? Color(0xFF5A8FE1)
                                        : Colors.white,
                                    fontSize: 12,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
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
