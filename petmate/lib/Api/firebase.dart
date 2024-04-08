import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseData {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore store = FirebaseFirestore.instance;

  Future<bool> Join(String email, String pass, String name, String nickname,
      bool agree) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      String uid = userCredential.user!.uid;
      print('uid');
      await store.collection('user').doc(uid).set({
        'email': email,
        'name': name,
        'nickname': nickname,
        'policy_agreement': agree
      });

      return true;
    } catch (e) {
      print('오류 :$e');
      return false;
    }
  }
}
