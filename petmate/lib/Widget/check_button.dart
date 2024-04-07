import 'package:flutter/material.dart';

class CheckButton extends StatefulWidget {
  final VoidCallback event;
  final String content;
  const CheckButton({super.key, required this.event, required this.content});

  @override
  State<CheckButton> createState() => _CheckButtonState();
}

class _CheckButtonState extends State<CheckButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.event,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1B6EEE),
          border: Border.all(
            width: 1,
            color: Colors.white.withOpacity(0.20000000298023224),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            widget.content,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
