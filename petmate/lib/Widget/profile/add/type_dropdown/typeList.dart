import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class PetType extends StatefulWidget {
  const PetType({super.key});

  @override
  State<PetType> createState() => _PetTypeState();
}

class _PetTypeState extends State<PetType> {
  String _selectedType = '';
  String _selectedDog = '';
  bool TextfildWidget = false;
  Map<String, dynamic> petType = {};

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPetType();
  }

  Future<void> loadPetType() async {
    String data = await rootBundle.loadString('assets/pet_type.json');
    setState(() {
      petType = Map<String, dynamic>.from(json.decode(data));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
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
        child: Theme(
          data: Theme.of(context).copyWith(
            splashColor: Colors.grey,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButton<String>(
              iconSize: 25,
              dropdownColor: Colors.white,
              focusColor: Color(0xffCCCCCC),
              menuMaxHeight: 169,
              iconEnabledColor: Color(0xffCCCCCC),
              iconDisabledColor: Color(0xffCCCCCC),
              borderRadius: BorderRadius.circular(10),
              underline: SizedBox.shrink(),
              style: Black(14, FontWeight.w500),
              isExpanded: true,
              value: _selectedType.isNotEmpty ? _selectedType : null,
              hint: Container(
                padding: const EdgeInsets.fromLTRB(48, 0, 8, 0),
                width: 260.w,
                child: Text('반려동물의 품종을 선택해주세요.',
                    textAlign: TextAlign.center,
                    style: Gray(14.sp, FontWeight.w500)),
              ),
              items: petType.keys.map<DropdownMenuItem<String>>((pettype) {
                return DropdownMenuItem<String>(
                  value: pettype[0],
                  child: Container(
                    width: 286.w,
                    height: 30.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(pettype[0]),
                      ],
                    ),
                  ),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedType = '';
                });
              },
            ),
          ),
        ),
      ),
    ]);
  }
}
