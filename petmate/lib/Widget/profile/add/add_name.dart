import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';

class AddName extends StatefulWidget {
  
  const AddName({super.key,});

  @override
  State<AddName> createState() => _AddNameState();
}

class _AddNameState extends State<AddName> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned(
          child: Container(
            width: 263.w,
            child: TextField(
             
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: '이름을 알려주세요.*',
                hintStyle: whiteOpacity(16.sp, FontWeight.w600),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.6)),
                ),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(0, 15, 0, 0),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white, decorationThickness: 0),
              cursorColor: Colors.white,
              cursorWidth: 2,
              onChanged: (value) {
              
              },
            ),
          ),
        ),
        Positioned(
          left: 62.w,
          top: 58.h,
          child: Opacity(
            opacity: 0.60,
            child: Text('*표시는 필수 항목이에요.',
                textAlign: TextAlign.center, style: White(12, FontWeight.w500)),
          ),
        ),
      ],
    );
  }
}
