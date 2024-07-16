import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class DiseaseList extends StatefulWidget {
  const DiseaseList({super.key});

  @override
  State<DiseaseList> createState() => _DiseaseListState();
}

class _DiseaseListState extends State<DiseaseList> {
  TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> diseaseList = [];

  String _selectedDisease = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadDisease();
  }

  Future<void> loadDisease() async {
    String data = await rootBundle.loadString('assets/diseaselist.json');
    setState(() {
      diseaseList = List<Map<String, String>>.from(json.decode(data));
    });
  }

  void _addDisease() {
    if (_searchController.text.isNotEmpty) {
      setState(() {
        diseaseList.add({'name': _searchController.text});
        _searchController.clear();
      });
    }
  }

  void _removeDisease(int index) {
    setState(() {
      diseaseList.removeAt(index);
      if (diseaseList.isEmpty) {
        _selectedDisease = '';
      } else if (_selectedDisease == diseaseList[index]['type']) {
        _selectedDisease =
            diseaseList.isNotEmpty ? diseaseList[0]['type']! : '';
      }
    });
  }

  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      Container(
        width: 320.w,
        height: 40.h,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: GradientBoxBorder(
            width: 1,
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.5),
                Colors.white.withOpacity(0.2)
              ],
            ),
          ),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: DropdownButton<String>(
            iconSize: 25,
            menuMaxHeight: 168,
            dropdownColor: Colors.white,
            iconEnabledColor: Color(0xffCCCCCC),
            borderRadius: BorderRadius.circular(10),
            underline: SizedBox.shrink(),
            style: Black(14, FontWeight.w500),
            isExpanded: true,
            value: _selectedDisease.isNotEmpty ? _selectedDisease : null,
            hint: Container(
              padding: const EdgeInsets.fromLTRB(45, 0, 8, 0),
              width: 400.w,
              child: Text('분류를 선택해주세요.',
                  textAlign: TextAlign.center,
                  style: Gray(14, FontWeight.w500)),
            ),
            items: diseaseList.map<DropdownMenuItem<String>>((selectdisease) {
              return DropdownMenuItem<String>(
                value: selectdisease['name'],
                child: Center(child: Text(selectdisease['type'] ?? '')),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedDisease = value!;
              });
            },
          ),
        ),
      ),
      Container(
        width: 320.w,
        height: 40.h,
        margin: EdgeInsets.all(10),
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
          width: 344.w,
          // height: 30.h,
          margin: EdgeInsets.all(4),
          child: diseaseList.isNotEmpty
              ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: diseaseList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        height: 30.h,
                        child: Chip(
                          padding: EdgeInsets.all(2),
                          side: BorderSide(color: Colors.transparent),
                          backgroundColor: Colors.white,
                          label: Text(diseaseList[index]['name'] ?? ''),
                          onDeleted: () {
                            _removeDisease(index);
                          },
                          deleteIcon:
                              Image.asset('assets/image_asset/edit/close.png'),
                        ),
                      ),
                    );
                  },
                )
              : SizedBox.shrink()),
    ]);
  }
}
