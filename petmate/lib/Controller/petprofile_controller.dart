import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PetprofileController extends GetxController{
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String petList = '';
  String petType = '';
  String petGender = '';
  String petBirthday = '';
  String firstMeetday = '';
  String petWeight = '';
  String petNeuterDate = '';
  List<String> petDisease = [];
  List<String> petAllergy = [];
  List<String> vaccinationRecord = [];
  List<String> surgeryRecord = [];

  void petInfo() async {
    Map<String, dynamic> petinfo = {
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
    };
    await firestore.collection('petinfo').add(petinfo);
  }
}