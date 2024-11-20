import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:petmate/Util/textstyles.dart';

class NotificationContainer extends StatefulWidget {
  const NotificationContainer({super.key});

  @override
  State<NotificationContainer> createState() => _NotificationContainer1State();
}

class _NotificationContainer1State extends State<NotificationContainer> {
  final text = ['기록', '정보', '거래', '모임'];
  final image = [
    'assets/alert/note (16).png',
    'assets/alert/information(16).png',
    'assets/alert/trade(16).png',
    'assets/alert/group(16).png',
  ];

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
        for (int i = 0; i < 4; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Stack(
              children: [
                GlassContainer(
                  width: 344.w,
                  height: 88.h,
                  margin: EdgeInsets.symmetric(vertical: 2),
                  color: Color(0x3300287C),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.10, 0.30, 0.40, 0.0],
                  ),
                  blur: 12,
                  borderRadius: BorderRadius.circular(10),
                  borderWidth: 1,
                  elevation: 0,
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 2,
                      offset: Offset(2, 2),
                      spreadRadius: 0,
                    )
                  ],
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
                        Image.asset(image[i]),
                        Text(text[i], style: White(14, FontWeight.w600)),
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
