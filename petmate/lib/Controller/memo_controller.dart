import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MemoController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController contentController = TextEditingController();
  String Memocontent = '';
 

 

  Future<List<Map<String, dynamic>>> getMemos() async {
    try {
      QuerySnapshot snapshot = await firestore
          .collection('Memo')
          .orderBy('timestamp', descending: true)
          .get();
      List<Map<String, dynamic>> memos = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        print('Fetched memo: $data');
        return {
          'id': doc.id,
          'content': data['content'],
          'timestamp': (data['timestamp'] as Timestamp).toDate(),
        };
      }).toList();
      print('Fetched memos: $memos');
      return memos;
    } catch (e) {
      print('Error fetching memos: $e');
      return [];
    }
  }

  Future<void> deletedMemo(docId) async {
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
