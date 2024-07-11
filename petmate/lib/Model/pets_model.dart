import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class PetType {
  String? type;
  List<Pet>? pet;
  PetType({
    this.type,
    this.pet,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'pet': pet!.map((x) => x.toMap()).toList(),
    };
  }

  factory PetType.fromMap(Map<String, dynamic> map) {
    return PetType(
      type: map['type'] != null ? map['type'] as String : null,
      pet: map['pet'] != null ? List<Pet>.from((map['pet'] as List<int>).map<Pet?>((x) => Pet.fromMap(x as Map<String,dynamic>),),) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PetType.fromJson(String source) => PetType.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Pet {
  String? name;
  Pet({
    this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Pet.fromMap(Map<String, dynamic> map) {
    return Pet(
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Pet.fromJson(String source) => Pet.fromMap(json.decode(source) as Map<String, dynamic>);
}
