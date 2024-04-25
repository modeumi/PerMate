import 'package:flutter/material.dart';

class LocationSearch extends StatefulWidget {
  const LocationSearch({super.key});

  @override
  State<LocationSearch> createState() => _LocationSearchState();
}

class _LocationSearchState extends State<LocationSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 40,
      decoration: ShapeDecoration(
          color: Color(0xFF5A8FE1),
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  width: 1,
                  color: Colors.white.withOpacity(0.20000000298023224)),
              borderRadius: BorderRadius.circular(30)),
          shadows: [
            BoxShadow(
                color: Color(0x26000000),
                blurRadius: 2,
                offset: Offset(2, 2),
                spreadRadius: 0)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset('assets/mapimg/icon (1).png'),
          Text(
            '현 위치에서 검색',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
