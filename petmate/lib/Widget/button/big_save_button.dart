import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';

class BigSaveButton extends StatefulWidget {
  final String content;
  final VoidCallback action;
  final bool? active;
  const BigSaveButton({
    super.key,
    required this.content,
    required this.action,
    this.active,
  });

  @override
  State<BigSaveButton> createState() => _BigSaveButtonState();
}

class _BigSaveButtonState extends State<BigSaveButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.action();
      },
      child: Container(
        width: 320.w,
        height: 52.h,
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            color: widget.active ?? true
                ? const Color(0xFF2B80FF)
                : Colors.black.withOpacity(0.2),
            border: Border.all(
              width: 1,
              color: Colors.white.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            widget.content,
            style:White(16.sp, FontWeight.w600)
          ),
        ),
      ),
    );
  }
}
