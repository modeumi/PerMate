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

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 40.h,
      margin: EdgeInsets.all(4),
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
        padding: const EdgeInsets.all(4),
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
            });
          },
        ),
      ),
    );
  }
}
