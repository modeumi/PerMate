import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';

class CalenderButton extends StatefulWidget {
  const CalenderButton({super.key});

  @override
  State<CalenderButton> createState() => _CalenderButtonState();
}

class _CalenderButtonState extends State<CalenderButton> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GlassContainer(
          width: 138.w,
          height: 40.h,
          color: Color(0xff00297C).withOpacity(0.2),
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.white.withOpacity(0.2)],
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
          borderRadius: BorderRadius.circular(20.r),
          borderWidth: 1.w,
          elevation: 0,
          boxShadow: [
            BoxShadow(
              color: Color(0x26000000),
              blurRadius: 2,
              offset: Offset(2, 2),
            )
          ],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 0;
                  });
                },
                child: Container(
                  width: 61.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:
                        selectedIndex == 0 ? Colors.white : Colors.transparent,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '기록',
                      style: TextStyle(
                        color: selectedIndex == 0
                            ? Color(0xFF1847A2)
                            : Colors.white.withOpacity(0.6),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = 1;
                  });
                },
                child: Container(
                  width: 61.w,
                  height: 32.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color:
                        selectedIndex == 1 ? Colors.white : Colors.transparent,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '사진',
                      style: TextStyle(
                        color: selectedIndex == 1
                            ? Color(0xFF1847A2)
                            : Colors.white.withOpacity(0.6),
                        fontSize: 12,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
