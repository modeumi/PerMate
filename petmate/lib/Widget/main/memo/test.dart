// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';

// class MemosController extends GetxController {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   final selectedMemoIds = <String, bool>{}.obs;

//   Stream<List<Map<String, dynamic>>> getMemos() {
//     return firestore
//         .collection('Memo')
//         .orderBy('timestamp', descending: true)
//         .snapshots()
//         .map((snapshot) => snapshot.docs.map((doc) {
//               Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
//               return {
//                 'id': doc.id,
//                 'content': data['content'],
//                 'timestamp': (data['timestamp'] as Timestamp).toDate(),
//               };
//             }).toList());
//   }

//   Future<void> deleteSelectedMemos() async {
//     final selectedIds = selectedMemoIds.keys
//         .where((id) => selectedMemoIds[id] == true)
//         .toList();

//     if (selectedIds.isEmpty) {
//       Get.snackbar('삭제 실패', '선택된 메모가 없습니다.');
//       return;
//     }
//     try {
//       final batch = firestore.batch();
//       for (String id in selectedIds) {
//         final docRef = firestore.collection('Memo').doc(id);
//         batch.delete(docRef);
//       }
//       await batch.commit();
//       selectedMemoIds.clear(); // Clear selection after deletion
//       Get.snackbar('삭제 성공', '메모가 삭제되었습니다.');
//     } catch (e) {
//       print('Error deleting memos: $e');
//       Get.snackbar('삭제 실패', '메모를 삭제하는 중 오류가 발생했습니다.');
//     }
//   }
// }

// class MemoList extends StatelessWidget {
//   final MemosController memosController = Get.put(MemosController());

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Memo List'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.delete),
//             onPressed: () async {
//               await memosController.deleteSelectedMemos();
//             },
//           ),
//         ],
//       ),
//       body: StreamBuilder<List<Map<String, dynamic>>>(
//         stream: memosController.getMemos(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('No memos available.'));
//           }
//           return Obx(() => ListView(
//                 children: snapshot.data!.map((memo) {
//                   String memoId = memo['id'];
//                   bool isSelected =
//                       memosController.selectedMemoIds[memoId] ?? false;
//                   return ListTile(
//                     leading: Checkbox(
//                       value: isSelected,
//                       onChanged: (bool? value) {
//                         // Update the selectedMemoIds map
//                         print('확인메세지test : $memoId');
//                         memosController.selectedMemoIds[memoId] =
//                             value ?? false;
//                       },
//                     ),
//                     title: Text(memo['content']),
//                     subtitle: Text(memo['timestamp'].toString()),
//                   );
//                 }).toList(),
//               ));
//         },
//       ),
//     );
//   }
// }
