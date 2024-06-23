import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/button/big_save_button.dart';

import 'package:petmate/Widget/custom_container.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/allergy_type.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/bth.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/disease.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/diseasefiled.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/first_meet.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/gender.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/neuter_or.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/neutering.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/petList.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/petweight.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/surgery_record.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/typeList.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/vaccination_record.dart';

class AddInfoWidget extends StatefulWidget {
  const AddInfoWidget({super.key});

  @override
  State<AddInfoWidget> createState() => _AddInfoWidgetState();
}

class _AddInfoWidgetState extends State<AddInfoWidget> {
  List text = [
    '종류*',
    '품종*',
    '성별*',
    '생일*',
    '처음 만난 날',
    '몸무게',
    '중성화 여부*',
    '중성화 날짜',
    '염려 · 보유 질환',
    '보유 알러지',
    '접종 기록',
    '수술 기록'
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomContainer(
          width: 344.w,
          height: 1180.h,
        ),
        Container(
          width: 344.w,
          height: 1180.h,
          padding: EdgeInsets.symmetric(
            vertical: 12,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                  width: 320.w,
                  child: Text('종류*', style: White(14.sp, FontWeight.w600))),
              PetList(),
              Container(
                  width: 300.w,
                  child: Text('품종*', style: White(14.sp, FontWeight.w600))),
              TypeList(),
              Container(
                  width: 300.w,
                  child: Text('성별*', style: White(14.sp, FontWeight.w600))),
              GenderType(),
              Container(
                  width: 300.w,
                  child: Text('생일*', style: White(14.sp, FontWeight.w600))),
              Container(
                  width: 300.w,
                  child: Text('처음 만난 날', style: White(14.sp, FontWeight.w600))),
              Container(
                  width: 300.w,
                  child: Text('몸무게', style: White(14.sp, FontWeight.w600))),
              Container(
                  width: 300.w,
                  child: Text('품종*', style: White(14.sp, FontWeight.w600))),
              Container(
                  width: 300.w,
                  child: Text('중성화 여부*', style: White(14.sp, FontWeight.w600))),
              Container(
                  width: 300.w,
                  child:
                      Text('중성화 날짜 *', style: White(14.sp, FontWeight.w600))),
              Container(
                  width: 300.w,
                  child:
                      Text('염려 · 보유 질환', style: White(14.sp, FontWeight.w600))),
              Container(
                  width: 300.w,
                  child: Text('보유 알러지', style: White(14.sp, FontWeight.w600))),
              // AllergyType(),

              Container(
                  width: 300.w,
                  child: Text('접종 기록', style: White(14.sp, FontWeight.w600))),
              // VaccinationRecord(),

              Container(
                  width: 300.w,
                  child: Text('수술 기록', style: White(14.sp, FontWeight.w600))),
              // SurgeryRecord(),
            ],
          ),
        ),
        Container(
          child: Stack(
            children: [
              // SizedBox(
              //   height: 12,
              // ),
              // Text('품종*', style: White(14.sp, FontWeight.w600)),
              // TypeList(),
              // SizedBox(
              //   height: 16,
              // ),
              // Text('성별*', style: White(14.sp, FontWeight.w600)),
              // GenderType(),
              // SizedBox(
              //   height: 16,
              // ),
              // Text('생일*', style: White(14.sp, FontWeight.w600)),
              // Brithday(),
              // SizedBox(
              //   height: 16,
              // ),
              // Text('처음 만난 날', style: White(14.sp, FontWeight.w600)),
              // FirstMeetDay(),
              // SizedBox(
              //   height: 16,
              // ),
              // Text('몸무게', style: White(14.sp, FontWeight.w600)),
              // PetWeight(),
              // SizedBox(
              //   height: 16,
              // ),
              // Text('중성화 여부*', style: White(14.sp, FontWeight.w600)),
              // NeuterOr(),
              // SizedBox(
              //   height: 16.h,
              // ),
              // Text('중성화 날짜', style: White(14.sp, FontWeight.w600)),
              // Neutering(),
              // SizedBox(
              //   height: 16,
              // ),
              // Text('염려 · 보유 질환', style: White(14.sp, FontWeight.w600)),
              // DiseaseList(),
              // DiseaseSearch(),
              // SizedBox(
              //   height: 16.h,
              // ),
              // Text('보유 알러지', style: White(14.sp, FontWeight.w600)),
              // AllergyType(),
              // SizedBox(
              //   height: 16,
              // ),
              // Text('접종 기록', style: White(14.sp, FontWeight.w600)),
              // VaccinationRecord(),
              // SizedBox(
              //   height: 16.h,
              // ),
              // Text('수술 기록', style: White(14.sp, FontWeight.w600)),
              // SurgeryRecord(),
              // BigSaveButton(content: '저장', action: () {})
            ],
          ),
        ),
      ],
    );
  }
}
