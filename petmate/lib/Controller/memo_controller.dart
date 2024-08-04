import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MemoController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController contentController = TextEditingController();
  String Memocontent = '';
  Map<String, bool> selectedMemoIds = {};

  Stream<List<Map<String, dynamic>>> getMemos() {
    return firestore
        .collection('Memo')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) {
              Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
              return {
                'id': doc.id,
                'content': data['content'],
                'timestamp': (data['timestamp'] as Timestamp).toDate(),
              };
            }).toList());
  }

  Future<void> addMemo(String content) async {
    try {
      DocumentReference docRef = await firestore.collection('Memo').add({
        'content': content,
        'timestamp': FieldValue.serverTimestamp(),
      });
      String docId = docRef.id;
      print('Added memo with ID: $docId');
    } catch (e) {
      print('Error adding memo: $e');
    }
  }

  Future<void> deletedMemo(String docId) async {
    if (docId.isEmpty) {
      Get.snackbar('삭제 실패', '문서 ID가 비어 있습니다.');
      return;
    }
    try {
      await firestore.collection('Memo').doc(docId).delete();
      Get.back();
      Get.snackbar('삭제 성공', '메모가 삭제되었습니다.');
    } catch (e) {
      print('Error deleting memo: $e');
      Get.snackbar('삭제 실패', '메모를 삭제하는 중 오류가 발생했습니다.');
    }
  }
}
