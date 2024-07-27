import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';

class PetWeight extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const PetWeight({super.key, required this.onChanged});

  @override
  State<PetWeight> createState() => _PetWeightState();
}

class _PetWeightState extends State<PetWeight> {
  TextEditingController _textEditingController = TextEditingController();
  FocusNode _focusNode = FocusNode();
  String initialText = "KG";

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(
      () {
        if (_focusNode.hasFocus) {
          setState(() {
            _textEditingController.text = initialText;
            widget.onChanged;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 10),
      child: Container(
        width: 320.w,
        height: 40.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: TextField(
          controller: _textEditingController,
          focusNode: _focusNode,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: '-- KG',
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
            widget.onChanged;
          },
        ),
      ),
    );
  }
}
