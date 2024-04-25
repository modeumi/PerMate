import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
/// coord : {"lon":9.19,"lat":45.4642}
/// listed : [{"main":{"aqi":3},"components":{"co":337.12,"no":0.46,"no2":5.48,"o3":144.48,"so2":1.88,"pm2_5":24.62,"pm10":26.92,"nh3":9.25},"dt":1651237200}]

class CurrentAir {
  Coord? coord;
  List<Listed>? listed;
  CurrentAir({
    this.coord,
    this.listed,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coord': coord?.toMap(),
      'listed': listed!.map((x) => x.toMap()).toList(),
    };
  }

  factory CurrentAir.fromMap(Map<String, dynamic> map) {
    return CurrentAir(
      coord: map['coord'] != null
          ? Coord.fromMap(map['coord'] as Map<String, dynamic>)
          : null,
      listed: map['listed'] != null
          ? List<Listed>.from(
              (map['listed'] as List<int>).map<Listed?>(
                (x) => Listed.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentAir.fromJson(String source) =>
      CurrentAir.fromMap(json.decode(source) as Map<String, dynamic>);
}

/// main : {"aqi":3}
/// components : {"co":337.12,"no":0.46,"no2":5.48,"o3":144.48,"so2":1.88,"pm2_5":24.62,"pm10":26.92,"nh3":9.25}
/// dt : 1651237200

class Listed {
  Main? main;
  Components? components;
  int? dt;
  Listed({
    this.main,
    this.components,
    this.dt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'main': main?.toString(),
      'components': components?.toMap(),
      'dt': dt,
    };
  }

  factory Listed.fromMap(Map<String, dynamic> map) {
    return Listed(
      main: map['main'] != null
          ? Main.fromJson(map['main'] as Map<String, dynamic>)
          : null,
      components: map['components'] != null
          ? Components.fromMap(map['components'] as Map<String, dynamic>)
          : null,
      dt: map['dt'] != null ? map['dt'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Listed.fromJson(String source) =>
      Listed.fromMap(json.decode(source) as Map<String, dynamic>);
}

/// co : 337.12
/// no : 0.46
/// no2 : 5.48
/// o3 : 144.48
/// so2 : 1.88
/// pm2_5 : 24.62
/// pm10 : 26.92
/// nh3 : 9.25

class Components {
  double? pm2_5;
  double? pm10;
  Components({
    this.pm2_5,
    this.pm10,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pm2_5': pm2_5,
      'pm10': pm10,
    };
  }

  factory Components.fromMap(Map<String, dynamic> map) {
    return Components(
      pm2_5: map['pm2_5'] != null ? map['pm2_5'] as double : null,
      pm10: map['pm10'] != null ? map['pm10'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Components.fromJson(String source) =>
      Components.fromMap(json.decode(source) as Map<String, dynamic>);
}

/// aqi : 3

class Main {
  Main({
    this.aqi,
  });

  Main.fromJson(dynamic json) {
    aqi = json['aqi'];
  }
  int? aqi;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['aqi'] = aqi;
    return map;
  }
}

/// lon : 9.19
/// lat : 45.4642

class Coord {
  double? lon;
  double? lat;
  Coord({
    this.lon,
    this.lat,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lon': lon,
      'lat': lat,
    };
  }

  factory Coord.fromMap(Map<String, dynamic> map) {
    return Coord(
      lon: map['lon'] != null ? map['lon'] as double : null,
      lat: map['lat'] != null ? map['lat'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coord.fromJson(String source) => Coord.fromMap(json.decode(source) as Map<String, dynamic>);
}
