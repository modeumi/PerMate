import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

// class AirData {
//   double? pm2_5;
//   double? pm10;
//   AirData({
//     this.pm2_5,
//     this.pm10,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'pm2_5': pm2_5,
//       'pm10': pm10,
//     };
//   }

//   factory AirData.fromMap(Map<String, dynamic> map) {
//     return AirData(
//       pm2_5: map['pm2_5'] != null ? map['pm2_5'] as double : null,
//       pm10: map['pm10'] != null ? map['pm10'] as double : null,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory AirData.fromJson(String source) => AirData.fromMap(json.decode(source) as Map<String, dynamic>);
// }

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
