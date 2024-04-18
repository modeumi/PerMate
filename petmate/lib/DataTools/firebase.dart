import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';

class FirebaseData {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore store = FirebaseFirestore.instance;

  Future<bool> Join(String email, String pass, String name, String nickname,
      String gender, String birth, bool agree) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      String uid = userCredential.user!.uid;
      print('uid');
      await store.collection('user').doc(uid).set({
        'email': email,
        'name': name,
        'nickname': nickname,
        'gender': gender,
        'birth': birth,
        'policy_agreement': agree
      });
      return true;
    } catch (e) {
      print('오류 :$e');
      return false;
    }
  }

  Future<bool> Duplication_Check_Email(String email) async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await store.collection('user').where('email', isEqualTo: email).get();
    if (snapshot.docs.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> Duplication_Check_Nickname(String nickname) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await store
        .collection('user')
        .where('nickname', isEqualTo: nickname)
        .get();
    if (snapshot.docs.isEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
