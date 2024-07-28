import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';

class SurgeryRecord extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const SurgeryRecord({super.key, required this.onChanged});

  @override
  State<SurgeryRecord> createState() => _VaccinationRecordState();
}

class _VaccinationRecordState extends State<SurgeryRecord> {
  TextEditingController surgeryrecordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 10),
      child: Container(
        width: 320.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: surgeryrecordController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: '수술 기록을 추가해주세요.',
            hintStyle: Gray(14.sp, FontWeight.w500),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            contentPadding: EdgeInsets.fromLTRB(1, 0, 0, 10),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          ),
          style: TextStyle(
            color: Color(0xFF303030),
            decorationThickness: 0,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            fontFamily: 'Pretendard',
          ),
          cursorColor: Colors.black,
          cursorWidth: 1,
          onChanged: (value) {
            widget.onChanged(value);
          },
        ),
      ),
    );
  }
}
