import 'package:flutter/material.dart';
import 'package:petmate/Util/textstyles.dart';

class PetWeight extends StatefulWidget {
  const PetWeight({super.key});

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
    return Stack(children: [
      Container(
        width: 320,
        height: 40,
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          // border: GradientBoxBorder(
          //   width: 1,
          //   gradient: LinearGradient(
          //     colors: [
          //       Colors.white.withOpacity(0.5),
          //       Colors.white.withOpacity(0.2)
          //     ],
          //   ),
          // ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          controller: _textEditingController,
          focusNode: _focusNode,
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: '-- KG',
            hintStyle: Gray(14, FontWeight.w500),
            enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            border: OutlineInputBorder(borderSide: BorderSide.none),
            contentPadding: EdgeInsets.fromLTRB(1, 0, 0, 10),
            focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          ),
          style: TextStyle(
            color: Colors.black,
            decorationThickness: 0,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Pretendard',
          ),
          cursorColor: Colors.black,
          cursorWidth: 1,
        ),
        // child: BlurryContainer(
        //   blur: 12,
        //   elevation: 0,
        //   borderRadius: BorderRadius.circular(10),
        //   child: Container()
        // ),
      ),
      // Opacity(
      //   opacity: 0.4,
      //   child: Container(
      //     margin: EdgeInsets.all(4),
      //     width: 320,
      //     height: 40,
      //     decoration: BoxDecoration(
      //         boxShadow: [
      //           BoxShadow(
      //             color: Color(0x4C000000),
      //             blurRadius: 2,
      //             offset: Offset(0, 0),
      //             spreadRadius: 0,
      //           )
      //         ],
      //         color: Colors.white,
      //         borderRadius: BorderRadius.circular(10)),
      //   ),
      // ),
    ]);
  }
}
