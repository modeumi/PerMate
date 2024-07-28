import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';

class VaccinationRecord extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const VaccinationRecord({super.key, required this.onChanged});

  @override
  State<VaccinationRecord> createState() => _VaccinationRecordState();
}

class _VaccinationRecordState extends State<VaccinationRecord> {
    TextEditingController _VaccinationRecordController = TextEditingController();
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
          controller: _VaccinationRecordController,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: '접종 기록을 추가해주세요.',
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
