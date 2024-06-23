import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';

class DiseaseSearch extends StatefulWidget {
  const DiseaseSearch({super.key});

  @override
  State<DiseaseSearch> createState() => _DiseaseSearchState();
}

class _DiseaseSearchState extends State<DiseaseSearch> {
  List<String> diseaseList = [];
  TextEditingController _searchController = TextEditingController();

  void _addDisease() {
    if (_searchController.text.isNotEmpty) {
      setState(() {
        diseaseList.add(_searchController.text);
        _searchController.clear();
      });
    }
  }

  void _removeDisease(int index) {
    setState(() {
      diseaseList.removeAt(index);
    });
  }

  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 320.w,
          height: 40.h,
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: TextField(
            controller: _searchController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              hintText: '염려 · 보유질환을 입력해주세요.',
              hintStyle: Gray(14.sp, FontWeight.w500),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide.none),
              border: OutlineInputBorder(borderSide: BorderSide.none),
              contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 11),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide.none),
            ),
            style: TextStyle(color: Colors.black, decorationThickness: 0),
            cursorColor: Colors.black,
            cursorWidth: 1.w,
            onSubmitted: (value) {
              _addDisease();
            },
          ),
        ),
        Container(
            width: double.infinity,
            height: 36.h,
            margin: EdgeInsets.all(4),
            child: diseaseList.isNotEmpty
                ? ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: diseaseList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Chip(
                          padding: EdgeInsets.all(5),
                          side: BorderSide(color: Colors.transparent),
                          backgroundColor: Colors.white,
                          label: Text(diseaseList[index]),
                          onDeleted: () {
                            _removeDisease(index);
                          },
                          deleteIcon:
                              Image.asset('assets/image_asset/edit/close.png'),
                        ),
                      );
                    },
                  )
                : SizedBox.shrink()),
      ],
    );
  }
}
