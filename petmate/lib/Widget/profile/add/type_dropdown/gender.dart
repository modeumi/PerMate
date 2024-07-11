import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class GenderType extends StatefulWidget {
  const GenderType({super.key});

  @override
  State<GenderType> createState() => _GenderTypeState();
}

class _GenderTypeState extends State<GenderType> {
  bool gendercheck = false;
  int button = -1;
  final gender = ['남', '여'];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 340.w,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(2, (int i) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  if (button == i) {
                  } else {
                    button = i;
                  }
                });
              },
              child: Stack(children: [
                Container(
                  width: 154.w,
                  height: 40.h,
                  margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: button == i ? Colors.white : Colors.transparent,
                    border: GradientBoxBorder(
                      width: 1,
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.2)
                        ],
                      ),
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                Opacity(
                  opacity: 0.4,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    width: 154.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: button == i
                                ? Colors.white.withOpacity(0.2)
                                : Color(0x4C000000),
                            blurRadius: 2,
                            offset: Offset(0, 0),
                            spreadRadius: 0,
                          )
                        ],
                        color: Color(0x3300287C),
                        borderRadius: BorderRadius.circular(10.r)),
                  ),
                ),
                Positioned(
                  left: 75,
                  top: 12,
                  child: Text(
                    gender[i],
                    style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: button == i ? Color(0xFF303030) : Colors.white,
                        fontFamily: 'Pretendard'),
                  ),
                )
              ]),
            );
          })),
    );
  }
}
