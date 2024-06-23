import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';

class Brithday extends StatefulWidget {
  const Brithday({super.key});

  @override
  State<Brithday> createState() => _BrithdayState();
}

class _BrithdayState extends State<Brithday> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 320.w,
        height: 40.h,
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          // border: GradientBoxBorder(
          //   width: 1,
          //   gradient: LinearGradient(
          //     colors: [
          //       Colors.white.withOpacity(0.5),
          //       Colors.white.withOpacity(0.2)
          //     ],
          //   ),
          // ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: 'YYYY.MM.DD',
            hintStyle: Gray(14.sp, FontWeight.w500),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            contentPadding: EdgeInsets.fromLTRB(1, 0, 0, 10),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          ),
          style: TextStyle(color: Colors.black, decorationThickness: 0),
          cursorColor: Colors.black,
          cursorWidth: 1.w,
        ),
        // child: BlurryContainer(
        //   blur: 12,
        //   elevation: 0,
        //   borderRadius: BorderRadius.circular(10),
        //   child: Container()
        // ),
      ),
      // Opacity(
      //   opacity: 0.4,
      //   child: Container(
      //     margin: EdgeInsets.all(4),
      //     width: 320,
      //     height: 40,
      //     decoration: BoxDecoration(
      //         boxShadow: [
      //           BoxShadow(
      //             color: Color(0x4C000000),
      //             blurRadius: 2,
      //             offset: Offset(0, 0),
      //             spreadRadius: 0,
      //           )
      //         ],
      //         color: Colors.white,
      //         borderRadius: BorderRadius.circular(10)),
      //   ),
      // ),
    ]);
  }
}
