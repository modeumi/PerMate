import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MemoController extends GetxController{
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    
   Future<List<Map<String, dynamic>>> fetchMemos() async {
    QuerySnapshot snapshot = await firestore.collection('Memo').get();
    return snapshot.docs
        .map((doc) => {
              'content': doc['content'],
              'timestamp': (doc['timestamp'] as Timestamp).toDate(),
            })
        .toList();
  }
}