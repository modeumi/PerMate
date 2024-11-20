import 'dart:convert';

class AirModel {
  final double pm2_5;
  final double pm10;

  AirModel({required this.pm2_5, required this.pm10});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pm2_5': pm2_5,
      'pm10': pm10,
    };
  }

  factory AirModel.fromMap(Map<String, dynamic> map) {
    return AirModel(
      pm2_5: map['pm2_5'] as double,
      pm10: map['pm10'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory AirModel.fromJson(String source) =>
      AirModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
