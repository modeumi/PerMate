import 'package:flutter/material.dart';

class TextFieldSlot extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  const TextFieldSlot(
      {super.key, required this.hint, required this.controller});

  @override
  State<TextFieldSlot> createState() => _TextFieldSlotState();
}

class _TextFieldSlotState extends State<TextFieldSlot> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 44,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: TextField(
        controller: widget.controller,
        decoration:
            InputDecoration(hintText: widget.hint, border: InputBorder.none),
      ),
    );
  }
}
