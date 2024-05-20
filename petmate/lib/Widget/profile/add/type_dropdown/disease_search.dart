import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class DiseaseSearch extends StatefulWidget {
  const DiseaseSearch({Key? key}) : super(key: key);

  @override
  State<DiseaseSearch> createState() => _DiseaseSearchState();
}

class _DiseaseSearchState extends State<DiseaseSearch> {
  List<String> diseaseList = [];
  Map<String, int> countDisease = {};
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(children: [
          Container(
              width: 134,
              height: 36,
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
              child: Container(
                width: 10,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '눈 알러지',
                      style: Black(12, FontWeight.w500),
                    ),
                    Image.asset('assets/image_asset/edit/close.png')
                  ],
                ),
              )),
          // child: BlurryContainer(
          //   blur: 12,
          //   elevation: 0,
          //   borderRadius: BorderRadius.circular(10),
          //   child: Container()
          // ),

          // Opacity(
          //   opacity: 0.4,
          //   child: Container(
          //     margin: EdgeInsets.all(4),
          //     width: 136,
          //     height: 36,
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
        ]),
      ],
    );
  }
}
