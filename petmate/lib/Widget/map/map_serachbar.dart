import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MapSearchBar extends StatefulWidget {
  const MapSearchBar({super.key});

  @override
  State<MapSearchBar> createState() => _MapSearchBarState();
}

class _MapSearchBarState extends State<MapSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 344.w,
          height: 40.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x26000000),
                  blurRadius: 2,
                  offset: Offset(0, 2),
                  spreadRadius: 0,
                )
              ]),
        ),
        Positioned(
          left: 10.w,
          top: 8.h,
          child: Container(
            width: 296.w,
            height: 24.h,
            child: TextFormField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: '검색어를 입력해주세요.',
                  hintStyle: TextStyle(
                    color: Color(0xFFCCCCCC),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  )),
            ),
          ),
        ),
        Positioned(
            right: 10,
            bottom: 8,
            child: GestureDetector(
                onTap: () {}, child: Image.asset('assets/mapimg/Search.png')))
      ],
    );
  }
}
