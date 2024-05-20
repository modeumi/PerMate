import 'package:flutter/material.dart';
import 'package:petmate/Util/textstyles.dart';

class DiseaseFiled extends StatefulWidget {
  const DiseaseFiled({super.key});

  @override
  State<DiseaseFiled> createState() => _DiseaseFiledState();
}

class _DiseaseFiledState extends State<DiseaseFiled> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintText: '염려 · 보유질환을 입력해주세요.',
          hintStyle: Gray(14, FontWeight.w500),
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
          border: OutlineInputBorder(borderSide: BorderSide.none),
          contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 11),
          focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
        ),
        style: TextStyle(color: Colors.black, decorationThickness: 0),
        cursorColor: Colors.black,
        cursorWidth: 1,
      ),
      // child: BlurryContainer(
      //   blur: 12,
      //   elevation: 0,
      //   borderRadius: BorderRadius.circular(10),
      //   child: Container()
      // ),
    );
  }
}
