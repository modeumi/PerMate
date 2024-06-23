import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/bottom_bar/bottom_navigationbar.dart';
import 'package:petmate/Widget/button/alarm_save_button.dart';
import 'package:petmate/Widget/button/save_button2.dart';
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
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: Stack(children: [
            Container(
              width: 344.w,
              height: 1180.h,
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.transparent,
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
              child: BlurryContainer(
                blur: 12,
                elevation: 0,
                borderRadius: BorderRadius.circular(10.r),
                child: Container(),
              ),
            ),
            Opacity(
              opacity: 0.4,
              child: Container(
                margin: EdgeInsets.all(4),
                width: 344.w,
                height: 1180.h,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x4C000000),
                        blurRadius: 10,
                        offset: Offset(2, 2),
                        spreadRadius: 0,
                      )
                    ],
                    color: Color(0x3300287C),
                    borderRadius: BorderRadius.circular(10.r)),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(14, 16, 14, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('종류*', style: White(14.sp, FontWeight.w600)),
                  PetList(),
                  SizedBox(
                    height: 12,
                  ),
                  Text('품종*', style: White(14.sp, FontWeight.w600)),
                  TypeList(),
                  SizedBox(
                    height: 16,
                  ),
                  Text('성별*', style: White(14.sp, FontWeight.w600)),
                  GenderType(),
                  SizedBox(
                    height: 16,
                  ),
                  Text('생일*', style: White(14.sp, FontWeight.w600)),
                  Brithday(),
                  SizedBox(
                    height: 16,
                  ),
                  Text('처음 만난 날', style: White(14.sp, FontWeight.w600)),
                  FirstMeetDay(),
                  SizedBox(
                    height: 16,
                  ),
                  Text('몸무게', style: White(14.sp, FontWeight.w600)),
                  PetWeight(),
                  SizedBox(
                    height: 16,
                  ),
                  Text('중성화 여부*', style: White(14.sp, FontWeight.w600)),
                  NeuterOr(),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text('중성화 날짜', style: White(14.sp, FontWeight.w600)),
                  Neutering(),
                  SizedBox(
                    height: 16,
                  ),
                  Text('염려 · 보유 질환', style: White(14.sp, FontWeight.w600)),
                  DiseaseList(),
                  DiseaseSearch(),
                
                  SizedBox(
                    height: 16.h,
                  ),
                  Text('보유 알러지', style: White(14.sp, FontWeight.w600)),
                  AllergyType(),
                  SizedBox(
                    height: 16,
                  ),
                  Text('접종 기록', style: White(14.sp, FontWeight.w600)),
                  VaccinationRecord(),
                  SizedBox(
                    height: 16.h,
                  ),
                  Text('수술 기록', style: White(14.sp, FontWeight.w600)),
                  SurgeryRecord(),
                  SizedBox(
                    height: 10.h,
                  ),
                  SaveButton2Widget()
                ],
              ),
            ),
          ]),
        ),
      ],
    );
  }
}
