import 'package:cloud_firestore/cloud_firestore.dart';
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
          color: Color(0x3300287C),
          shadow_color: Color(0x4C000000),
        ),
        Container(
          width: 344.w,
          height: 1150.h,
          padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildLabel('종류*'),
              PetList(
                onChanged: (value) {
                  setState(() {
                    petprofileController.petList = value;
                  });
                },
              ),
              _buildLabel('품종*'),
              PetType(
                onChanged: (value) {
                  setState(() {
                    petprofileController.petType = value;
                    
                  });
                }, 
              ),
              _buildLabel('성별*'),
              OptionType(
                width: 340.w,
                options: ['남', '여'],
                onChanged: (value) {
                  petprofileController.petGender = value;
                },
              ),
              _buildLabel('생일*'),
              Brithday(
                onChanged: (value) {
                  petprofileController.petBirthday = value;
                },
              ),
              _buildLabel('처음 만난 날'),
              FirstMeetDay(
                onChanged: (value) {
                  petprofileController.firstMeetday = value;
                },
              ),
              _buildLabel('몸무게'),
              PetWeight(
                onChanged: (value) {
                  petprofileController.petWeight = value;
                },
              ),
              _buildLabel('중성화 여부*'),
              Selectedthree(
                selected: ['했음', '안했음', '모르겠음'],
                onChanged: (value) {
                  petprofileController.petNeuter = value;
                },
              ),
              _buildLabel('중성화 날짜 *'),
              NeuterDate(
                onChanged: (value) {
                  petprofileController.petNeuterDate = value;
                },
              ),
              _buildLabel('염려 · 보유 질환'),
              DiseaseType(
                onChanged: (value) {
                  petprofileController.petDisease = value;
                },
              ),
              _buildLabel('보유 알러지'),
              AllergyType(
                onChanged: (value) {
                  petprofileController.petAllergy = value;
                },
              ),
              _buildLabel('접종 기록'),
              VaccinationRecord(
                onChanged: (value) {
                  petprofileController.vaccinationRecord = value;
                },
              ),
              _buildLabel('수술기록'),
              SurgeryRecord(
                onChanged: (value) {
                  petprofileController.surgeryRecord = value;
                },
              ),
              BigSaveButton(
                  content: '저장', action: petprofileController.petInfo),
            ],
          ),
        ),
      ],
    );
  }
}

Widget _buildLabel(String text) {
  return Container(
    width: 320.w,
    height: 17.h,
    child: Text(text, style: White(14.sp, FontWeight.w600)),
  );
}
