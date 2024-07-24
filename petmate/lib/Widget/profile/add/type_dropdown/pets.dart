import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class Pets extends StatefulWidget {
  const Pets({super.key});

  @override
  State<Pets> createState() => _PetsState();
}

class _PetsState extends State<Pets> {
  final TextEditingController _petSearchController = TextEditingController();
  String _selectedPetType = '';
  String _selectedPetBreed = '';
  bool _showTextField = false;
  Map<String, dynamic> petType = {};
  List<Map<String, dynamic>> petSelect = [];

  @override
  void initState() {
    super.initState();
    loadPetType();
    loadPetSelect();
  }

  Future<void> loadPetType() async {
    String data = await rootBundle.loadString('assets/pet_type.json');
    setState(() {
      petType = Map<String, dynamic>.from(json.decode(data));
    });
  }

  Future<void> loadPetSelect() async {
    String data = await rootBundle.loadString('assets/pet_select.json');
    setState(() {
      petSelect = List<Map<String, dynamic>>.from(json.decode(data));
    });
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
                value: _selectedPetType.isNotEmpty ? _selectedPetType : null,
                hint: Container(
                  padding: const EdgeInsets.fromLTRB(48, 0, 8, 0),
                  width: 260.w,
                  child: Text('반려동물의 종류를 선택해주세요.',
                      textAlign: TextAlign.center,
                      style: Gray(14.sp, FontWeight.w500)),
                ),
                items: petSelect.map<DropdownMenuItem<String>>((petselect) {
                  return DropdownMenuItem<String>(
                    value: petselect['id'],
                    child: Container(
                      width: 286.w,
                      height: 30.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (petselect['image'] != null)
                            Image.asset(
                              petselect['image'],
                              width: 24.w,
                              height: 24.h,
                            ),
                          if (petselect['id'] != null)
                            SizedBox(
                              width: 4.w,
                            ),
                          Text(petselect['id'] ?? '직접입력'),
                        ],
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedPetType = value!;
                    _selectedPetBreed = ''; // Reset breed selection
                  });
                },
              ),
            ),
          ),
        ),
        if (_selectedPetType == '직접입력')
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
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _petSearchController,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  hintText: '직접 입력해주세요.',
                  hintStyle: Gray(14.sp, FontWeight.w500),
                  enabledBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 11),
                  focusedBorder:
                      UnderlineInputBorder(borderSide: BorderSide.none),
                ),
                style: TextStyle(color: Colors.black, decorationThickness: 0),
                cursorColor: Colors.black,
                cursorWidth: 1.w,
                onChanged: (value) {
                  setState(() {
                    _selectedPetBreed = value;
                  });
                },
              ),
            ),
          )
        else
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
                  value:
                      _selectedPetBreed.isNotEmpty ? _selectedPetBreed : null,
                  hint: Container(
                    padding: const EdgeInsets.fromLTRB(48, 0, 8, 0),
                    width: 260.w,
                    child: Text('반려동물의 품종을 선택해주세요.',
                        textAlign: TextAlign.center,
                        style: Gray(14.sp, FontWeight.w500)),
                  ),
                  items: petType[_selectedPetType] != null
                      ? petType[_selectedPetType]
                          .map<DropdownMenuItem<String>>((pet) {
                          return DropdownMenuItem<String>(
                            value: pet['name'],
                            child: Container(
                              width: 286.w,
                              height: 30.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(pet['name']),
                                ],
                              ),
                            ),
                          );
                        }).toList()
                      : [],
                  onChanged: (value) {
                    setState(() {
                      _selectedPetBreed = value ?? '';
                    });
                  },
                ),
              ),
            ),
          ),
      ],
    );
  }
}
