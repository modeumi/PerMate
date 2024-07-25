import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class AllergyType extends StatefulWidget {
  const AllergyType({super.key});

  @override
  State<AllergyType> createState() => _AllergyTypeState();
}

class _AllergyTypeState extends State<AllergyType> {
  String _selectAllergy = '';
  List<String> allergyType = [];
  List<String> SelectAllergy = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadAllergy();
  }

  Future<void> _loadAllergy() async {
    try {
      String data = await rootBundle.loadString('assets/allergy.json');
      List<dynamic> jsonData = json.decode(data);
      setState(() {
        allergyType =
            jsonData.map<String>((item) => item['type'] as String).toList();
      });
    } catch (e) {
      print("Error loading allergy data: $e");
    }
  }

  void _removeDisease(int index) {
    setState(() {
      SelectAllergy.removeAt(index);
    });
  }

  @override
  void dispose() {
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
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton(
                iconSize: 25,
                menuMaxHeight: 168,
                dropdownColor: Colors.white,
                iconEnabledColor: Color(0xffCCCCCC),
                borderRadius: BorderRadius.circular(10.r),
                underline: SizedBox.shrink(),
                style: Black(14.sp, FontWeight.w500),
                isExpanded: true,
                value: _selectAllergy.isNotEmpty ? _selectAllergy : null,
                hint: Container(
                  width: 280.w,
                  padding: const EdgeInsets.fromLTRB(48, 0, 8, 0),
                  child: Text('보유 알러지를 선택해주세요.',
                      textAlign: TextAlign.center,
                      style: Gray(14.sp, FontWeight.w600)),
                ),
                items: allergyType.map<DropdownMenuItem<String>>((allergy) {
                  return DropdownMenuItem<String>(
                    value: allergy,
                    child: Center(child: Text(allergy)),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectAllergy = value!;
                    if (!SelectAllergy.contains(_selectAllergy)) {
                      SelectAllergy.add(_selectAllergy);
                    }
                  });
                },
              ),
            ),
          ),
          Container(
              width: 344.w,
              height: SelectAllergy.isNotEmpty ? 36.h : 0,
              margin: EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: allergyType.isNotEmpty
                  ? ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: SelectAllergy.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          child: Chip(
                            labelStyle: Black(12.sp, FontWeight.w500),
                            side: BorderSide(color: Colors.transparent),
                            backgroundColor: Colors.white,
                            label: Text(
                              SelectAllergy[index],
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
