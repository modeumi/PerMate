import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/button/big_save_button.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/allergy_type.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/bth.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/disease.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/first_meet.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/gender.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/neuter_or.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/neutering.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/petList.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/pets.dart';
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
    return Stack(
      children: [
        Positioned(
          child: CustomContainer(
            width: 344.w,
            height: 1200.h,
            shadow_color: Color(0x4C000000),
          ),
        ),
        Positioned(
          child: Container(
            width: 344.w,
            height: 1200.h,
            padding: EdgeInsets.symmetric(
              vertical: 12,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    width: 320.w,
                    height: 25,
                    child: Text('종류*', style: White(14.sp, FontWeight.w600))),
                PetList(),
                Container(
                    width: 320.w,
                    height: 25,
                    child: Text('품종*', style: White(14.sp, FontWeight.w600))),
                PetType(),
                Container(
                    width: 320.w,
                    height: 25,
                    child: Text('성별*', style: White(14.sp, FontWeight.w600))),
                GenderType(),
                Container(
                    width: 320.w,
                    height: 25,
                    child: Text('생일*', style: White(14.sp, FontWeight.w600))),
                Brithday(),
                Container(
                    width: 320.w,
                    height: 25,
                    child:
                        Text('처음 만난 날', style: White(14.sp, FontWeight.w600))),
                FirstMeetDay(),
                Container(
                    width: 320.w,
                    height: 25,
                    child: Text('몸무게', style: White(14.sp, FontWeight.w600))),
                PetWeight(),
                Container(
                    width: 320.w,
                    height: 25,
                    child:
                        Text('중성화 여부*', style: White(14.sp, FontWeight.w600))),
                NeuterOr(),
                Container(
                    width: 320.w,
                    height: 25,
                    child:
                        Text('중성화 날짜 *', style: White(14.sp, FontWeight.w600))),
                Neutering(),
                Container(
                    width: 320.w,
                    height: 25,
                    child: Text('염려 · 보유 질환',
                        style: White(14.sp, FontWeight.w600))),
                DiseaseList(),
                Container(
                    width: 320.w,
                    height: 25,
                    child:
                        Text('보유 알러지', style: White(14.sp, FontWeight.w600))),
                AllergyType(),
                Container(
                    width: 320.w,
                    height: 25,
                    child: Text('접종 기록', style: White(14.sp, FontWeight.w600))),
                VaccinationRecord(),
                Container(
                    width: 320.w,
                    height: 25,
                    child: Text('수술 기록', style: White(14.sp, FontWeight.w600))),
                SurgeryRecord(),
                BigSaveButton(content: '저장하기', action: () {}),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
