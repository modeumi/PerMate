import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Memo {
  int? id;
  String? content;
  Memo({
    this.id,
    this.content,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'content': content,
    };
  }

  factory Memo.fromMap(Map<String, dynamic> map) {
    return Memo(
      id: map['id'] != null ? map['id'] as int : null,
      content: map['content'] != null ? map['content'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Memo.fromJson(String source) =>
      Memo.fromMap(json.decode(source) as Map<String, dynamic>);
}

FirebaseFirestore _firestore = FirebaseFirestore.instance;

Future<void> addMemo(String userId, String content) async {
  try {
    await _firestore.collection('memo').add({
      'userId': userId,
      'content': content,
      'timestamp': FieldValue.serverTimestamp()
    });
  } catch (e) {
    print('Error adding memo: $e');
  }
}

// Stream<List<Memo>> getMemos(String userId) {
//   return _firestore
//       .collection('memo')
//       .where('userId', isEqualTo: userId)
//       .orderBy('timestamp', descending: true)
//       .snapshots()
//       .map((querySnapshot) => querySnapshot.docs
//           .map((doc) => Memo.fromFirestore(doc.data()))
//           .toList());
// }
