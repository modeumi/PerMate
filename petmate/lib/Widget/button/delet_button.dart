import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';

class DeletButton extends StatefulWidget {
  final String content;
  final VoidCallback action;
  final bool? active;
  const DeletButton({
    super.key,
    required this.content,
    required this.action,
    this.active,
  });

  @override
  State<DeletButton> createState() => _DeletButtonState();
}

class _DeletButtonState extends State<DeletButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.action();
      },
      child: Container(
        width: 344.w,
        height: 60.h,
        margin: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
            color: widget.active ?? true
                ? Colors.white.withOpacity(0.8)
                : Colors.black.withOpacity(0.2),
            border: Border.all(
              width: 1,
              color: Colors.white.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(widget.content, style: Red(16.sp, FontWeight.w600)),
        ),
      ),
    );
  }
}
