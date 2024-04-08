import 'package:flutter/material.dart';

class TextFieldSlot extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool status;
  final VoidCallback action;
  final bool password;
  const TextFieldSlot(
      {super.key,
      required this.hint,
      required this.controller,
      required this.status,
      required this.action,
      required this.password});

  @override
  State<TextFieldSlot> createState() => _TextFieldSlotState();
}

class _TextFieldSlotState extends State<TextFieldSlot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 44,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 9),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: widget.status
              ? null
              : Border.all(width: 1.5, color: const Color(0xFFFF0000))),
      child: TextField(
        controller: widget.controller,
        onChanged: (value) {
          print(value);
          widget.action();
        },
        obscureText: widget.password,
        decoration: InputDecoration(
            hintText: widget.hint,
            border: InputBorder.none,
            hintStyle: const TextStyle(
              color: Color(0xFFCCCCCC),
              fontSize: 12,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w500,
            )),
      ),
    );
  }
}
