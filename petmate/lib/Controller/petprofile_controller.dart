import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class PetprofileController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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
}
