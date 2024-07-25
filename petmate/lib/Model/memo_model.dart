import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class MemoModel {
  String? content;
  MemoModel({
    this.content,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'content': content,
    };
  }

  factory MemoModel.fromMap(Map<String, dynamic> map) {
    return MemoModel(
      content: map['content'] != null ? map['content'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MemoModel.fromJson(String source) =>
      MemoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
