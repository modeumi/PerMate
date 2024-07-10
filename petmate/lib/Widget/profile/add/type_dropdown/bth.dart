import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';

class Brithday extends StatefulWidget {
  const Brithday({super.key});

  @override
  State<Brithday> createState() => _BrithdayState();
}

class _BrithdayState extends State<Brithday> {
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 320.w,
        height: 40.h,
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: _textEditingController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'YYYY.MM.DD',
            hintStyle: Gray(14.sp, FontWeight.w500),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            contentPadding: EdgeInsets.fromLTRB(1, 0, 0, 10),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          ),
          style: TextStyle(
            color: Colors.black,
            decorationThickness: 0,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Pretendard',
          ),
          cursorColor: Colors.black,
          cursorWidth: 1.w,
        ),
      ),
    ]);
  }
}
