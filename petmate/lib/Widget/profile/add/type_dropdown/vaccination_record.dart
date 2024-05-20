import 'package:flutter/material.dart';
import 'package:petmate/Util/textstyles.dart';

class VaccinationRecord extends StatefulWidget {
  const VaccinationRecord({super.key});

  @override
  State<VaccinationRecord> createState() => _VaccinationRecordState();
}

class _VaccinationRecordState extends State<VaccinationRecord> {
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
          textAlign: TextAlign.center,
          decoration: InputDecoration(
            hintText: '접종 기록을 추가해주세요.',
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
