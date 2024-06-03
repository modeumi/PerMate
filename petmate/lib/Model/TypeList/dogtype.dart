import 'dart:convert';

class DogList {
  final String name;
  DogList({
    required this.name,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory DogList.fromMap(Map<String, dynamic> map) {
    return DogList(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory DogList.fromJson(String source) => DogList.fromMap(json.decode(source) as Map<String, dynamic>);
}