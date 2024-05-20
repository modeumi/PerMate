// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Model/TypeList/dogtype.dart';
import 'package:petmate/Util/textstyles.dart';

class TypeList extends StatefulWidget {
  const TypeList({super.key});

  @override
  State<TypeList> createState() => _TypeListState();
}

class _TypeListState extends State<TypeList> {
  String? _selectedDogType;
  List<DogList> dogs = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dogList();
  }

  Future<void> _dogList() async {
    String response = await rootBundle.loadString('assets/text_file/dog.json');
    List<dynamic> data = json.decode(response);
    setState(() {
      dogs = data.map((json) => DogList.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 320,
        height: 40,
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
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: DropdownButton(
            iconSize: 25,
            menuMaxHeight: 168,
            iconEnabledColor: Color(0xffCCCCCC),
            borderRadius: BorderRadius.circular(10),
            underline: SizedBox.shrink(),
            style: Black(14, FontWeight.w500),
            isExpanded: true,
            value: _selectedDogType,
            hint: Container(
              padding: const EdgeInsets.fromLTRB(45, 0, 8, 0),
              width: 280,
              color: Colors.white,
              child: Text('반려동물의 품종을 선택해주세요.',
                  textAlign: TextAlign.center,
                  style: Gray(14, FontWeight.w500)),
            ),
            items: dogs.map<DropdownMenuItem<String>>((DogList breed) {
              return DropdownMenuItem<String>(
                value: breed.name,
                child: Center(child: Text(breed.name)),
              );
            }).toList(),
            onChanged: (String? breed) {
              setState(() {
                _selectedDogType = breed!;
              });
            },
          ),
        ),
      ),
    ]);
  }
}
