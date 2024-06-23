// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class TypeList extends StatefulWidget {
  const TypeList({Key? key}) : super(key: key);

  @override
  State<TypeList> createState() => _TypeListState();
}

class _TypeListState extends State<TypeList> {
  static Future loadJson() async {
    final String response =
        await rootBundle.loadString('assets/text_file/dog.json');
    final data = await json.decode(response);
    return data['dog'];
  }

  Future dogList = loadJson();

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                isExpanded: true,
                value: '',
                hint: Container(
                  padding: const EdgeInsets.fromLTRB(48, 0, 8, 0),
                  width: 260.w,
                  child: Text('반려동물의 품종을 선택해주세요.',
                      textAlign: TextAlign.center,
                      style: Gray(14.sp, FontWeight.w500)),
                ),
                items: [],
                onChanged: (value) {},
              ),
            ),
            // child: FutureBuilder(
            //   future: dogList,
            //   builder: (context, snapshot) {
            //     if (snapshot.hasData) {
            //       return ListView.builder(
            //         itemCount: snapshot.data,
            //         itemBuilder: (context, index) {
            //           return Container(
            //             child: Text("${snapshot.data[index]['name']}"),
            //           );
            //         },
            //       );
            //     } else if (snapshot.hasError) {
            //       return Text("Error");
            //     } else {
            //       return CircularProgressIndicator();
            //     }
            //   },
            // ),
          ),
        ),
      ],
    );
  }
}

class Dog {
  String? name;
  Dog({
    this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Dog.fromMap(Map<String, dynamic> map) {
    return Dog(
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Dog.fromJson(String source) =>
      Dog.fromMap(json.decode(source) as Map<String, dynamic>);
}
