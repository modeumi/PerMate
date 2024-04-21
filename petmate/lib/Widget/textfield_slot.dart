import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFieldSlot extends StatefulWidget {
  final String hint;
  final TextEditingController controller;
  final bool status;
  final VoidCallback action;
  final bool password;
  final Widget? addwidget;
  const TextFieldSlot(
      {super.key,
      required this.hint,
      required this.controller,
      required this.status,
      required this.action,
      required this.password,
      this.addwidget});

  @override
  State<TextFieldSlot> createState() => _TextFieldSlotState();
}

class _TextFieldSlotState extends State<TextFieldSlot> {
  bool? status;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    status = widget.password;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: widget.status
              ? null
              : Border.all(width: 1.5, color: const Color(0xFFFF0000))),
      child: Stack(
        children: [
          TextField(
            controller: widget.controller,
            cursorColor: Colors.blue,
            textAlignVertical: TextAlignVertical.center,
            textAlign: TextAlign.left,
            onChanged: (value) {
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
          Positioned(
              right: 10,
              top: 0,
              bottom: 0,
              child: widget.addwidget ?? Container())
        ],
      ),
    );
  }
}
