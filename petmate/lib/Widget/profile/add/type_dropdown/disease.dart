import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class DiseaseType extends StatefulWidget {
  const DiseaseType({super.key});

  @override
  State<DiseaseType> createState() => _DiseaseTypeState();
}

class _DiseaseTypeState extends State<DiseaseType> {
  TextEditingController _searchController = TextEditingController();
  String _selectDisease = '';
  List<String> DiseaseType = [];
  List<String> addDisease = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadDisease();
  }

  Future<void> _loadDisease() async {
    try {
      String data = await rootBundle.loadString('assets/disease.json');
      List<dynamic> jsonData = json.decode(data);
      setState(() {
        DiseaseType =
            jsonData.map<String>((item) => item['type'] as String).toList();
      });
    } catch (e) {
      print("Error loading allergy data: $e");
    }
  }

  void _addDisease() {
    if (_searchController.text.isNotEmpty) {
      setState(() {
        addDisease.add(_searchController.text);
        _searchController.clear();
      });
    }
  }

  void _removeDisease(int index) {
    setState(() {
      addDisease.removeAt(index);
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 10),
      child: Column(
        children: [
          Container(
            width: 320.w,
            height: 40.h,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
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
              child: DropdownButton(
                iconSize: 25,
                menuMaxHeight: 168,
                dropdownColor: Colors.white,
                iconEnabledColor: Color(0xffCCCCCC),
                borderRadius: BorderRadius.circular(10.r),
                underline: SizedBox.shrink(),
                style: Black(14.sp, FontWeight.w500),
                isExpanded: true,
                value: _selectDisease.isNotEmpty ? _selectDisease : null,
                hint: Container(
                  width: 280.w,
                  padding: const EdgeInsets.fromLTRB(48, 0, 8, 0),
                  child: Text('분류를 선택해주세요.',
                      textAlign: TextAlign.center,
                      style: Gray(14.sp, FontWeight.w600)),
                ),
                items: DiseaseType.map<DropdownMenuItem<String>>((disease) {
                  return DropdownMenuItem<String>(
                    value: disease,
                    child: Center(child: Text(disease)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectDisease = value!;
                    if (!addDisease.contains(_selectDisease)) {
                      addDisease.add(_selectDisease);
                    }
                  });
                },
              ),
            ),
          ),
          Container(
            width: 320.w,
            height: 40.h,
            margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
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
                enabledBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none),
                border: OutlineInputBorder(borderSide: BorderSide.none),
                contentPadding: EdgeInsets.fromLTRB(12, 0, 0, 11),
                focusedBorder:
                    UnderlineInputBorder(borderSide: BorderSide.none),
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
              width: 340.w,
              height: addDisease.isNotEmpty ? 36.h : 0,
              margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: DiseaseType.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: addDisease.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: Chip(
                            labelStyle: Black(12.sp, FontWeight.w500),
                            side: BorderSide(color: Colors.transparent),
                            backgroundColor: Colors.white,
                            label: Text(
                              addDisease[index],
                            ),
                            onDeleted: () {
                              _removeDisease(index);
                            },
                            deleteIcon: Image.asset(
                                'assets/image_asset/edit/close.png'),
                          ),
                        );
                      },
                    )
                  : SizedBox.shrink()),
        ],
      ),
    );
  }
}
