import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/petprofile_controller.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/button/big_save_button.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/allergy_type.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/bth.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/disease.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/first_meet.dart';
import 'package:petmate/Widget/custom_widget/optiontype.dart';
import 'package:petmate/Widget/custom_widget/selectedthree.dart';
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
  PetprofileController petprofileController = Get.put(PetprofileController());

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomContainer(
          width: 344.w,
          height: 1150.h,
          shadow_color: Color(0x4C000000),
        ),
        Container(
          width: 344.w,
          height: 1150.h,
          padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 320.w,
                  height: 17.h,
                  child: Text('종류*', style: White(14.sp, FontWeight.w600))),
              PetList(
                onChanged: (value) {
                  setState(() {
                    petprofileController.petList = value;
                  });
                },
              ),
              Container(
                  width: 320.w,
                  height: 17.h,
                  child: Text('품종*', style: White(14.sp, FontWeight.w600))),
              PetType(
                onChanged: (value) {
                  setState(() {
                    petprofileController.petType = value;
                  });
                },
              ),
              Container(
                  width: 320.w,
                  height: 17.h,
                  child: Text('성별*', style: White(14.sp, FontWeight.w600))),
              OptionType(
                width: 340.w,
                options: ['남', '여'],
                onChanged: (value) {},
              ),
              Container(
                  width: 320.w,
                  height: 17.h,
                  child: Text('생일*', style: White(14.sp, FontWeight.w600))),
              Brithday(
                onChanged: (value) {
                  petprofileController.petBirthday = value;
                },
              ),
              Container(
                  width: 320.w,
                  height: 17.h,
                  child: Text('처음 만난 날', style: White(14.sp, FontWeight.w600))),
              FirstMeetDay(),
              Container(
                  width: 320.w,
                  height: 17.h,
                  child: Text('몸무게', style: White(14.sp, FontWeight.w600))),
              PetWeight(),
              Container(
                  width: 320.w,
                  height: 17.h,
                  child: Text('중성화 여부*', style: White(14.sp, FontWeight.w600))),
              Selectedthree(
                selected: ['했음', '안했음', '모르겠음'],
                onChanged: (value) {
                  
                },
              ),
              Container(
                  width: 320.w,
                  height: 17.h,
                  child:
                      Text('중성화 날짜 *', style: White(14.sp, FontWeight.w600))),
              NeuterDate(),
              Container(
                  width: 320.w,
                  height: 17.h,
                  child:
                      Text('염려 · 보유 질환', style: White(14.sp, FontWeight.w600))),
              DiseaseType(),
              Container(
                  width: 320.w,
                  height: 17.h,
                  child: Text('보유 알러지', style: White(14.sp, FontWeight.w600))),
              AllergyType(),
              Container(
                  width: 320.w,
                  height: 17.h,
                  child: Text('접종 기록', style: White(14.sp, FontWeight.w600))),
              VaccinationRecord(),
              Container(
                  width: 320.w,
                  height: 17.h,
                  child: Text('수술 기록', style: White(14.sp, FontWeight.w600))),
              SurgeryRecord(),
              BigSaveButton(content: '저장', action: () {}),
            ],
          ),
        ),
      ],
    );
  }
}
