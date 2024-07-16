import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class Pets extends StatefulWidget {
  const Pets({Key? key}) : super(key: key);

  @override
  State<Pets> createState() => _PetsState();
}

class _PetsState extends State<Pets> {
  bool search = false;
  final TextEditingController _petSearchController = TextEditingController();
  String _selectedPet = '';
  String _selectedType = '';
  bool textfieldWidget = false;
  Map<String, List<String>> petType = {};
  List<Map<String, dynamic>> petSelect = [];
 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadPetType();
    loadPetSelect();
  }

  Future<void> loadPetType() async {
    String data = await rootBundle.loadString('assets/pet_type.json');
    setState(() {
      petType = Map<String, List<String>> .from(json.decode(data));
      print('type: $_selectedType');
    });
  }

  Future<void> loadPetSelect() async {
    String data = await rootBundle.loadString('assets/pet_select.json');
    setState(() {
      petSelect =  List<Map<String, dynamic>>.from(json.decode(data));
      print('select: $_selectedType');
    });
  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: 320.w,
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: Colors.white,
          border: GradientBoxBorder(
            width: 1,
            gradient: LinearGradient(
              colors: [
                Colors.white.withOpacity(0.5),
                Colors.white.withOpacity(0.2),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DropdownButton<String>(
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
                  value: _selectedPet.isNotEmpty ? _selectedPet : null,
                  hint: Container(
                    padding: const EdgeInsets.fromLTRB(48, 0, 8, 0),
                    width: 260.w,
                    child: Text(
                      '반려동물의 종류를 선택해주세요.',
                      textAlign: TextAlign.center,
                      style: Gray(14.sp, FontWeight.w500),
                    ),
                  ),
                  items: petSelect.map<DropdownMenuItem<String>>((petselect) {
                    return DropdownMenuItem<String>(
                      value: petselect['type'],
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
                            if (petselect['image'] != null)
                              SizedBox(
                                width: 4.w,
                              ),
                            Text(petselect['type']),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    _selectedPet = value!;
                    _selectedType = '';
                    textfieldWidget = value == '직접입력';
                  },
                ),
                if (petType.containsKey(_selectedType))
                  DropdownButton<String>(
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
                      child: Text(
                        '반려동물의 품종을 선택해주세요.',
                        textAlign: TextAlign.center,
                        style: Gray(14.sp, FontWeight.w500),
                      ),
                    ),
                    items: petType[_selectedType]!
                        .map<DropdownMenuItem<String>>((String selecttype) {
                      return DropdownMenuItem<String>(
                        value: selecttype,
                        child: Container(
                          width: 286.w,
                          height: 30.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(selecttype),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedType = value!;
                      });
                    },
                  ),
                if (textfieldWidget)
                  TextField(
                    controller: _petSearchController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                      hintText: '직접 입력해주세요.',
                      hintStyle: Gray(14.sp, FontWeight.w500),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 11),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.black,
                      decorationThickness: 0,
                    ),
                    cursorColor: Colors.black,
                    cursorWidth: 1.w,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
