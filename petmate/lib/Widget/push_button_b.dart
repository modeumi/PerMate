import 'package:flutter/material.dart';

class PushButtonB extends StatefulWidget {
  final String content;
  final VoidCallback action;
  const PushButtonB({super.key, required this.content, required this.action});

  @override
  State<PushButtonB> createState() => _PushButtonBState();
}

class _PushButtonBState extends State<PushButtonB> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.action();
      },
      child: Container(
        height: 48,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
            color: const Color(0x3300287C),
            border: Border.all(
              width: 1,
              color: Colors.white.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Text(
            widget.content,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
