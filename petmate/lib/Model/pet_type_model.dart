import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Pets {
  String? name;
  String? image;
  List<Type>? type;
  Pets({
    this.name,
    this.image,
    this.type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'image': image,
      'type': type?.map((x) => x.toMap()).toList(),
    };
  }

  factory Pets.fromMap(Map<String, dynamic> map) {
    return Pets(
      name: map['name'] != null ? map['name'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      type: map['type'] != null
          ? List<Type>.from(
              (map['type'] as List<dynamic>).map<Type?>(
                (x) => Type.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pets.fromJson(String source) =>
      Pets.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Type {
  String? name;
  Type({
    this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Type.fromMap(Map<String, dynamic> map) {
    return Type(
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Type.fromJson(String source) => Type.fromMap(json.decode(source) as Map<String, dynamic>);
}
