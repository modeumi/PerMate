import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/petList.dart';
import 'package:petmate/Widget/profile/add/type_dropdown/typeList.dart';

class PetprofileController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController petSearchController = TextEditingController();
  TextEditingController typeSearchController = TextEditingController();
  bool showTextFiled = false;
  bool showTextField = false;
  bool search = false;

  String selectedPet = '';
  String selectedType = '';


  
    
  
 

  String petList = '';
  String petType = '';
  String petGender = '';
  String petBirthday = '';
  String firstMeetday = '';
  String petWeight = '';
  String petNeuter = '';
  String petNeuterDate = '';
  List<String> petDisease = [];
  List<String> petAllergy = [];
  String vaccinationRecord = '';
  String surgeryRecord = '';

  void petInfo() async {
    try {
      await firestore.collection('petinfo').add({
        'petList': petList,
        'petType': petType,
        'petGender': petGender,
        'petBirthday': petBirthday,
        'firstMeetday': firstMeetday,
        'petWeight': petWeight,
        'petNeuterDate': petNeuterDate,
        'petDisease': petDisease,
        'petAllergy': petAllergy,
        'vaccinationRecord': vaccinationRecord,
        'surgeryRecord': surgeryRecord,
      });

      Get.snackbar('sucess', '성공!');
    } catch (e) {
      Get.snackbar('Erorr', '실패!');
    }
  }

 

  List<Map<String, dynamic>> petselect = [];

  void Pet_List() {
    super.onInit();
    loadPetSelect();
  }

  Future<void> loadPetSelect() async {
    try {
      String data = await rootBundle.loadString('assets/pet_select.json');
      petSelect = List<Map<String, dynamic>>.from(json.decode(data));
    } catch (e) {
      print('Erorr Pet data: $e');
    }
  }

  Map<String, dynamic> typeselect = {};
  List<Map<String, dynamic>> petSelect = [];

  void Pet_Type() {
    super.onInit();
    loadPetType();
  }
  Future<void> loadPetType() async {
    try {
      String data = await rootBundle.loadString('assets/pet_type.json');
       typeselect = Map<String, dynamic>.from(json.decode(data));
    } catch (e) {
       print('Erorr type data: $e');
    }
    
   
  }


  
 


}
