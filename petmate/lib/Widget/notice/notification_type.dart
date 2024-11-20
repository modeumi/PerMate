import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

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
    return SizedBox(
      width: 344.w,
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
                          width: 80.w,
                          height: 40.h,
                          margin: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: button == index
                                ? Colors.white.withOpacity(0.8)
                                : Color(0x3300287C).withOpacity(0.2),
                            border: GradientBoxBorder(
                              width: 1.w,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withOpacity(0.5),
                                  Colors.white.withOpacity(0.2)
                                ],
                              ),
                            ),
                            borderRadius: BorderRadius.circular(20.r),
                          ),
                          child: button == index
                              ? Container()
                              : BlurryContainer(
                                  blur: 12,
                                  elevation: 0,
                                  borderRadius: BorderRadius.circular(20.r),
                                  child: Container(),
                                ),
                        ),
                        Opacity(
                          opacity: 0.4,
                          child: Container(
                            margin: EdgeInsets.all(3),
                            width: 80.w,
                            height: 40.h,
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Color(0x26000000),
                                    blurRadius: 2,
                                    offset: Offset(0, 2),
                                    spreadRadius: 0,
                                  )
                                ],
                                color: Color(0x3300287C).withOpacity(0.2),
                                borderRadius: BorderRadius.circular(20.r)),
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
