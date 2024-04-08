import 'package:auto_size_text/auto_size_text.dart';
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
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFF1B6EEE),
          border: Border.all(
            width: 1,
            color: Colors.white.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: AutoSizeText(
            widget.content,
            style: const TextStyle(
              fontFamily: 'Pretendard',
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
            presetFontSizes: [14],
            maxLines: 1,
          ),
        ),
      ),
    );
  }
}
