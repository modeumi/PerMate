import 'package:flutter/material.dart';

class PushButtonA extends StatefulWidget {
  final String content;
  final VoidCallback action;
  final bool? active;
  const PushButtonA(
      {super.key, required this.content, required this.action, this.active});

  @override
  State<PushButtonA> createState() => _PushButtonAState();
}

class _PushButtonAState extends State<PushButtonA> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.action();
      },
      child: Container(
        height: 48,
        margin: const EdgeInsets.symmetric(vertical: 32),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
            color: widget.active ?? true
                ? const Color(0xFF1B6EEE)
                : const Color(0xFF5A8FE1),
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
