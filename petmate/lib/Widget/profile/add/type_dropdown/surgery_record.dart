import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';

class SurgeryRecord extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const SurgeryRecord({super.key, required this.onChanged});

  @override
  State<SurgeryRecord> createState() => _SurgeryRecordState();
}

class _SurgeryRecordState extends State<SurgeryRecord> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 0),
      child: Container(
        width: 320.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: '수술 기록을 추가해주세요.',
            hintStyle: Gray(14.sp, FontWeight.w500),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 11),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          ),
          style: TextStyle(color: Colors.black, decorationThickness: 0),
          cursorColor: Colors.black,
          cursorWidth: 1.w,
          onChanged: (value) {
            widget.onChanged;
          },
        ),
      ),
    );
  }
}
