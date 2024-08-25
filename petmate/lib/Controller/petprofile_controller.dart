import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<void> petInfo() async {
    try {
      await firestore.collection('petinfo').add({
        'petImage': petImage,
        'addName': addName,
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

  Stream<List<Map<String, dynamic>>> getPetInfo() {
    return firestore
        .collection('petInfo')
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
              return {
                'id': doc.id,
                'petImage': data['petImage'] ?? '',
                'petList': data['petList'] ?? '',
                'petType': data['petType'] ?? '',
                'addName': data['addName'] ?? '',
                'petGender': data['petGender'] ?? '',
                'petBirthday': data['petBirthday'] ?? '',
                'firstMeetday': data['firstMeetday'] ?? '',
                'petWeight': data['petWeight'] ?? '',
                'petNeuterDate': data['petNeuterDate'] ?? '',
                'petDisease': List<String>.from(data['petDisease'] ?? []),
                'petAllergy': List<String>.from(data['petAllergy'] ?? []),
                'vaccinationRecord': data['vaccinationRecord'] ?? '',
                'surgeryRecord': data['surgeryRecord'] ?? '',
              };
            }).toList());
            
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
}
