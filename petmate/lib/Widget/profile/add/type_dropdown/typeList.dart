import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class PetType extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const PetType({super.key, required this.onChanged});

  @override
  State<PetType> createState() => _PetTypeState();
}

class _PetTypeState extends State<PetType> {
  TextEditingController _searchtext = TextEditingController();
  bool _showTextField = false;
  String _selectedType = '';
  Map<String, dynamic> petType = {};

  List<Map<String, dynamic>> petSelect = [];

  @override
  void initState() {
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
                  child: _showTextField || _selectedType == '직접입력'
                      ? TextField(
                          controller: _searchtext,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            hintText: '검색어를 입력해주세요.',
                            hintStyle: TextStyle(
                              color: Color(0xFF303030).withOpacity(0.6),
                              fontSize: 14.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                              color: Color(0xFF303030),
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w500,
                              decorationThickness: 0),
                          cursorColor: Color(0xFF303030).withOpacity(0.6),
                          cursorWidth: 2,
                          onChanged: (value) {
                            setState(() {
                              widget.onChanged(value);
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
                          value:
                              _selectedType.isNotEmpty ? _selectedType : null,
                          hint: Container(
                            padding: const EdgeInsets.fromLTRB(48, 0, 8, 0),
                            width: 260.w,
                            child: Text('반려동물의 종류를 선택해주세요.',
                                textAlign: TextAlign.center,
                                style: Gray(14.sp, FontWeight.w500)),
                          ),
                          items: [
                            DropdownMenuItem<String>(
                              alignment: Alignment.center,
                              value: _searchtext.text,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: TextField(
                                  controller: _searchtext,
                                  textAlign: TextAlign.center,
                                  decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child: Image.asset(
                                            'assets/image_asset/pet_upload/search.png'),
                                      ),
                                    ),
                                    hintText: '검색어를 입력해주세요.',
                                    hintStyle: TextStyle(
                                      color: Color(0xFF303030).withOpacity(0.6),
                                      fontSize: 14.sp,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            Color(0xFF303030).withOpacity(0.6),
                                      ),
                                    ),
                                    border: OutlineInputBorder(),
                                    contentPadding:
                                        EdgeInsets.fromLTRB(40, 20, 0, 0),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          width: 1.w,
                                          color: Color(0xFF303030)
                                              .withOpacity(0.6)),
                                    ),
                                  ),
                                  style: TextStyle(
                                      color: Color(0xFF303030),
                                      fontSize: 14,
                                      fontFamily: 'Pretendard',
                                      fontWeight: FontWeight.w500,
                                      decorationThickness: 0),
                                  cursorColor:
                                      Color(0xFF303030).withOpacity(0.6),
                                  cursorWidth: 2.w,
                                  onChanged: (value) {
                                    setState(() {
                                      _selectedType = value;
                                      _showTextField = true;
                                      widget.onChanged(value);
                                    });
                                  },
                                ),
                              ),
                            ),
                            ...petType.entries
                                .expand<DropdownMenuItem<String>>((entry) {
                              List<dynamic> typeName = entry.value;
                              return typeName
                                  .map<DropdownMenuItem<String>>((pet) {
                                return DropdownMenuItem<String>(
                                  value: pet['name'],
                                  child: Container(
                                    width: 286.w,
                                    height: 30.h,
                                    margin: EdgeInsets.fromLTRB(12, 0, 0, 0),
                                    child:
                                        Center(child: Text(pet['name'] ?? '')),
                                  ),
                                );
                              }).toList();
                            })
                          ],
                          onChanged: (value) {
                            setState(() {
                              _selectedType = value!;

                              _showTextField = value == '';
                              widget.onChanged(value);
                            });
                          },
                        )))),
    );
  }
}
