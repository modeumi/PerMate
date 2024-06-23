import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class DiseaseList extends StatefulWidget {
  const DiseaseList({super.key});

  @override
  State<DiseaseList> createState() => _DiseaseListState();
}

class _DiseaseListState extends State<DiseaseList> {
  String _selectedType = '';
  final TypeList = [
    '강아지',
    '고양이',
    '토끼',
    '거북이',
    '물고기',
    '새',
    '직접 입력',
  ];
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
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: DropdownButton(
            iconSize: 25,
            menuMaxHeight: 168,
            iconEnabledColor: Color(0xffCCCCCC),
            borderRadius: BorderRadius.circular(10),
            underline: SizedBox.shrink(),
            style: Black(14, FontWeight.w500),
            isExpanded: true,
            value: _selectedType.isNotEmpty ? _selectedType : null,
            hint: Container(
              padding: const EdgeInsets.fromLTRB(45, 0, 8, 0),
              width: 400.w,
              child: Text('분류를 선택해주세요.',
                  textAlign: TextAlign.center,
                  style: Gray(14, FontWeight.w500)),
            ),
            items: TypeList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Center(child: Text(value)),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedType = value!;
              });
            },
          ),
        ),
      ),
    ]);
  }
}
