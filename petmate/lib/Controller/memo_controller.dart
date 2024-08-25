import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MemoController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController contentController = TextEditingController();
  ScrollController scrollController = ScrollController();
  String Memocontent = '';
  Map<String, bool> selectedMemoIds = {};
 


 // 삭제할 메모 체크
  void memoCheckSeleced(String memoId) {
    selectedMemoIds[memoId] = !(selectedMemoIds[memoId] ?? false);
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

  Future<void> deletedselectMemo() async {
    final selectedId = selectedMemoIds.keys
        .where((id) => selectedMemoIds[id] == true)
        .toList();
    if (selectedId.isEmpty) {
      // Get.snackbar('삭제 실패', '선택된 메모가 없습니다.');
      return;
    }

    try {
      final batch = FirebaseFirestore.instance.batch();
      for (String id in selectedId) {
        final docRef = FirebaseFirestore.instance.collection('Memo').doc(id);
        batch.delete(docRef);
      }
      await batch.commit();
      selectedMemoIds.clear();
      // Get.snackbar('삭제 성공', '메모가 삭제되었습니다.');
    } catch (e) {
      print('Error memos: $e');
      // Get.snackbar('삭제 실패', '메모를 삭제하는 중 오류가 발생했습니다');
    }
  }
}
