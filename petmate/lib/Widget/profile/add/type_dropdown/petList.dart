import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class PetList extends StatefulWidget {
  const PetList({super.key});

  @override
  State<PetList> createState() => _PetListState();
}

class _PetListState extends State<PetList> {
  bool search = false;
  final TextEditingController _petSearchController = TextEditingController();
  String _selectedPet = '';
  bool TextfildWidget = false;
  final petList = {
    '강아지': 'assets/image_asset/pet_upload/animal_list (1).png',
    '고양이': 'assets/image_asset/pet_upload/animal_list (2).png',
    '토끼': 'assets/image_asset/pet_upload/animal_list (3).png',
    '거북이': 'assets/image_asset/pet_upload/animal_list (4).png',
    '물고기': 'assets/image_asset/pet_upload/animal_list (5).png',
    '새': 'assets/image_asset/pet_upload/animal_list (6).png',
    '직접 입력': null,
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setState(() {
    //   _selectedPet.isNotEmpty ? _selectedPet : null;
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
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
            child: TextfildWidget
                ? TextField(
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
                    style:
                        TextStyle(color: Colors.black, decorationThickness: 0),
                    cursorColor: Colors.black,
                    cursorWidth: 1.w,
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
                    style: Black(14, FontWeight.w500),
                    isExpanded: true,
                    value: _selectedPet.isNotEmpty ? _selectedPet : null,
                    hint: Container(
                      padding: const EdgeInsets.fromLTRB(48, 0, 8, 0),
                      width: 260.w,
                      child: Text('반려동물의 종류를 선택해주세요.',
                          textAlign: TextAlign.center,
                          style: Gray(14.sp, FontWeight.w500)),
                    ),
                    items: petList.keys
                        .map<DropdownMenuItem<String>>((String key) {
                      return DropdownMenuItem<String>(
                        value: key,
                        child: Container(
                          width: 286.w,
                          height: 30.h,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (petList[key] != null)
                                Image.asset(
                                  petList[key]!,
                                  width: 24.w,
                                  height: 24.h,
                                ),
                              if (petList[key] != null)
                                SizedBox(
                                  width: 4.w,
                                ),
                              Text(key),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (value) {
                      if (value == '직접 입력') {
                        setState(() {
                          TextfildWidget = true;
                          _selectedPet = '';
                        });
                      } else {
                        setState(() {
                          TextfildWidget = false;
                          _selectedPet = value!;
                        });
                      }
                    },
                  ),
          ),
        ),
      ),
    ]);
  }
}
