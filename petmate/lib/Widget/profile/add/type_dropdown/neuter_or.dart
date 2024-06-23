import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class NeuterOr extends StatefulWidget {
  const NeuterOr({super.key});

  @override
  State<NeuterOr> createState() => _NeuterOrState();
}

class _NeuterOrState extends State<NeuterOr> {
  bool gendercheck = false;
  int button = -1;
  final gender = ['했음', '안했음', '모르겠음'];
  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(3, (int i) {
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
            width: 100.w,
            height: 40.h,
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: button == i ? Colors.white : Colors.transparent,
              border: GradientBoxBorder(
                width: 1.w,
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.2)
                  ],
                ),
              ),
              borderRadius: BorderRadius.circular(10.r),
            ),
            // child: BlurryContainer(
            //   blur: 12,
            //   elevation: 0,
            //   borderRadius: BorderRadius.circular(10),
            //   child: Container(),
            // ),
          ),
          Opacity(
            opacity: 0.4,
            child: Container(
              margin: EdgeInsets.all(4),
              width: 100.w,
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
            top: 14,
            child: Container(
              width: 110.w,
              child: Text(
                gender[i],
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w500,
                    color: button == i ? Color(0xFF303030) : Colors.white,
                    fontFamily: 'Pretendard'),
              ),
            ),
          )
        ]),
      );
    }));
  }
}
