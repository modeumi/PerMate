import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';

class LocationSearch extends StatefulWidget {
  const LocationSearch({super.key});

  @override
  State<LocationSearch> createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 144,
          height: 40,
          decoration: ShapeDecoration(
              color: Color(0xFF2B80FF),
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                      width: 1, color: Colors.white.withOpacity(0.2)),
                  borderRadius: BorderRadius.circular(30)),
              shadows: [
                BoxShadow(
                    color: Color(0x26000000),
                    blurRadius: 2,
                    offset: Offset(2, 2),
                    spreadRadius: 0)
              ]),
          child: Opacity(
            opacity: 0.4,
            child: Container(
              width: 144,
              height: 40,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 2,
                      offset: Offset(4, 4),
                    )
                  ],
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        ),
        Positioned(
          left: 10,
          top: 9,
          child: Row(
            children: [
              Image.asset(
                'assets/mapimg/icon (1).png',
              ),
              SizedBox(
                width: 4,
              ),
              Text('현 위치에서 검색',
                  textAlign: TextAlign.center,
                  style: White(14.sp, FontWeight.w600)),
            ],
          ),
        ),
      ],
    );
  }
}
