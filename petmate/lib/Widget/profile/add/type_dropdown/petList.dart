import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class PetList extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const PetList({super.key, required this.onChanged});

  @override
  State<PetList> createState() => _PetListState();
}

class _PetListState extends State<PetList> {
  bool search = false;
  final TextEditingController _petSearchController = TextEditingController();
  String _selectedPet = '';
  bool _showTextFiled = false;

  List<Map<String, dynamic>> petSelect = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPetSelect();
  }

  Future<void> loadPetSelect() async {
    String data = await rootBundle.loadString('assets/pet_select.json');
    setState(() {
      petSelect = List<Map<String, dynamic>>.from(json.decode(data));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 4, 0, 10),
      child: Container(
          width: 320.w,
          height: 40.h,
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
                  child: _showTextFiled || _selectedPet == '직접입력'
                      ? TextField(
                          controller: _petSearchController,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: '직접 입력해주세요.',
                            hintStyle: Gray(14.sp, FontWeight.w500),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                            border:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 11),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide.none),
                          ),
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              decorationThickness: 0),
                          cursorColor: Colors.black,
                          cursorWidth: 1.w,
                          onChanged: (value) {
                            setState(() {
                              _selectedPet = value;
                            });
                          },
                        )
                      : DropdownButton<String>(
                          iconSize: 25,
                          dropdownColor: Colors.white,
                          focusColor: Color(0xffCCCCCC),
                          menuMaxHeight: 169,
                          iconEnabledColor: Color(0xffCCCCCC),
                          iconDisabledColor: Color(0xffCCCCCC),
                          borderRadius: BorderRadius.circular(10),
                          underline: SizedBox.shrink(),
                          style: Black(14.sp, FontWeight.w500),
                          isExpanded: true,
                          value: _selectedPet.isNotEmpty ? _selectedPet : null,
                          hint: Container(
                            padding: const EdgeInsets.fromLTRB(48, 0, 8, 0),
                            width: 260.w,
                            child: Text('반려동물의 종류를 선택해주세요.',
                                textAlign: TextAlign.center,
                                style: Gray(14.sp, FontWeight.w500)),
                          ),
                          items: [
                            ...petSelect
                                .map<DropdownMenuItem<String>>((petselect) {
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
                                      Text(
                                        petselect['id'] ?? '직접입력',
                                        style: Black(14.sp, FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            }).toList(),
                            DropdownMenuItem<String>(
                                value: '직접입력',
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      '직접입력',
                                      style: Black(14.sp, FontWeight.w500),
                                    )))
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedPet = value!;
                              _showTextFiled = value == '직접입력';
                            });
                            widget.onChanged;
                          },
                        )))),
    );
  }
}
