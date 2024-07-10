import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:petmate/Util/textstyles.dart';

class NotificationCheckDeleted extends StatefulWidget {
  const NotificationCheckDeleted({super.key});

  @override
  State<NotificationCheckDeleted> createState() =>
      _NotificationCheckDeletedState();
}

class _NotificationCheckDeletedState extends State<NotificationCheckDeleted> {
  List<bool> deletedCheck = List.generate(3, (index) => false);

  bool isChecked = false;
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
        Container(
          width: 36,
          height: 25,
          margin: EdgeInsets.only(
            top: 12,
            left: 10,
          ),
          child: Text('오늘',
              textAlign: TextAlign.center,
              style: White(16.sp, FontWeight.w600)),
        ),
        for (int i = 0; i < 2; i++)
          Stack(
            children: [
              GlassContainer(
                width: 344.w,
                height: 88.h,
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
                top: 14,
                child: Container(
                  width: 139.w,
                  height: 20.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                          onTap: () {
                            setState(() {
                              deletedCheck[i] = !deletedCheck[i];
                            });
                          },
                          child: Image.asset(deletedCheck[i]
                              ? 'assets/alert/check_selected.png'
                              : 'assets/alert/check_default.png')),
                      Image.asset(image[i]),
                      Text(text[i], style: White(14.sp, FontWeight.w600)),
                      Opacity(
                        opacity: 0.6,
                        child: Text('·  오후 5:00',
                            style: White(10.sp, FontWeight.w500)),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 17,
                top: 40,
                child: Container(
                  width: 320.w,
                  height: 40.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('‘공동육아’ 님이 ‘복실복실해’ 의 일지에 목욕기록을 남겼어요.',
                          style: White(12.sp, FontWeight.w500)),
                      Text('놓치지말고 확인해보세요!',
                          style: White(12.sp, FontWeight.w500))
                    ],
                  ),
                ),
              )
            ],
          ),
      ],
    );
  }
}
