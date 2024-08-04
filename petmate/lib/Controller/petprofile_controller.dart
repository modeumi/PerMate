import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PetprofileController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  bool showTextFiled = false;
  bool showTextField = false;
  bool search = false;

  String petImage = '';
  String addName = '';
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
        'petImage': petImage,
        'addName' : addName,
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

  //종류

  String selectedPet = '';
  List<Map<String, dynamic>> petSelect = [];

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

  //품종
  Map<String, dynamic> typeselect = {};
  String selectedType = '';

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

  Future<void> getPetInfo() async {
    try {
      QuerySnapshot snapshot = await firestore.collection('petinfo').get();
    } catch (e) {}
  }

// 질병

//몸무게
  // FocusNode focusNode = FocusNode();
  // String initialText = "KG";

  // void pet_weight() {
  //   super.onInit();
  //   focusNode.addListener(
  //     () {
  //       if (focusNode.hasFocus) {
  //         PetWeightController.text = initialText;
  //       }
  //     },
  //   );
  // }

  // void weight_dispose() {
  //   PetWeightController.dispose();
  //   focusNode.dispose();
  //   super.dispose();
  // }

  String select_Allergy = '';
  List<String> allergyType = [];
  List<String> selectAllergy = [];

  void Pet_Allergy() {
    // TODO: implement initState
    super.onInit();
    _loadAllergy();
  }

  Future<void> _loadAllergy() async {
    try {
      String data = await rootBundle.loadString('assets/allergy.json');
      List<dynamic> jsonData = json.decode(data);

      allergyType =
          jsonData.map<String>((item) => item['type'] as String).toList();
    } catch (e) {
      print("Error loading allergy data: $e");
    }
  }

  // void removeAllergy(int index) {
  //   selectAllergy.removeAt(index);
  //   onChanged(selectAllergy);
  // }
}
