import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class MemoController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<List<Map<String, dynamic>>> fetchMemos() async {
    try {
      QuerySnapshot snapshot = await firestore
          .collection('Memo')
          .orderBy('timestamp', descending: true)
          .get();
      List<Map<String, dynamic>> memos = snapshot.docs.map((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        print('Fetched memo: $data'); // Logging the fetched memo
        return {
          'content': data['content'],
          'timestamp': (data['timestamp'] as Timestamp).toDate(),
        };
      }).toList();
      print('Fetched memos: $memos'); // Logging the list of memos
      return memos;
    } catch (e) {
      print('Error fetching memos: $e'); // Logging any errors
      return [];
    }
  }

  // Stream<List<Map<String, dynamic>>> getMomo() {
  //   return firestore
  //       .collection('Memo')
  //       .orderBy('timestamp', descending: true)
  //       .snapshots()
  //       .map((snapshot) {
  //     return snapshot.docs.map((doc) {
  //       final data = doc.data() as Map<String, dynamic>;
  //       return {
  //         'content': data['content'],
  //         'timestamp': (data['timestamp'] as Timestamp).toDate(),
  //       };
  //     }).toList();
  //   });
  // }
}
