import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
// coord : {"lon":9.19,"lat":45.4642}
// weather : [{"id":802,"main":"Clouds","description":"구름조금","icon":"03d"}]
// base : "stations"
// main : {"temp":18.73,"feels_like":17.94,"temp_min":17.67,"temp_max":20.4,"pressure":1023,"humidity":49}
// visibility : 10000
// wind : {"speed":3.09,"deg":90}
// clouds : {"all":40}
// dt : 1651140421
// sys : {"type":2,"id":2012644,"country":"IT","sunrise":1651119376,"sunset":1651170299}
// timezone : 7200
// id : 3173435
// name : "Milan"
// cod : 200

class CurrentWeather {
  Coord? coord;
  List<Weather>? weather;
  String? base;
  Main? main;
  int? visibility;
  Clouds? clouds;
  Sys? sys;
  int? id;
  String? name;
  int? cod;
  CurrentWeather({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.clouds,
    this.sys,
    this.id,
    this.name,
    this.cod,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coord': coord?.toMap(),
      'weather': weather?.map((x) => x.toMap()).toList(),
      'base': base,
      'main': main?.toMap(),
      'visibility': visibility,
      'clouds': clouds?.toMap(),
      'sys': sys?.toMap(),
      'id': id,
      'name': name,
      'cod': cod,
    };
  }

  factory CurrentWeather.fromMap(Map<String, dynamic> map) {
    return CurrentWeather(
      coord: map['coord'] != null ? Coord.fromMap(map['coord'] as Map<String,dynamic>) : null,
      weather: map['weather'] != null ? List<Weather>.from((map['weather'] as List<int>).map<Weather?>((x) => Weather.fromMap(x as Map<String,dynamic>),),) : null,
      base: map['base'] != null ? map['base'] as String : null,
      main: map['main'] != null ? Main.fromMap(map['main'] as Map<String,dynamic>) : null,
      visibility: map['visibility'] != null ? map['visibility'] as int : null,
      clouds: map['clouds'] != null ? Clouds.fromMap(map['clouds'] as Map<String,dynamic>) : null,
      sys: map['sys'] != null ? Sys.fromMap(map['sys'] as Map<String,dynamic>) : null,
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      cod: map['cod'] != null ? map['cod'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CurrentWeather.fromJson(String source) => CurrentWeather.fromMap(json.decode(source) as Map<String, dynamic>);
}

/// type : 2
/// id : 2012644
/// country : "IT"
/// sunrise : 1651119376
/// sunset : 1651170299

class Sys {
  int? type;
  int? id;
  String? country;
  Sys({
    this.type,
    this.id,
    this.country,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'type': type,
      'id': id,
      'country': country,
    };
  }

  factory Sys.fromMap(Map<String, dynamic> map) {
    return Sys(
      type: map['type'] != null ? map['type'] as int : null,
      id: map['id'] != null ? map['id'] as int : null,
      country: map['country'] != null ? map['country'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Sys.fromJson(String source) => Sys.fromMap(json.decode(source) as Map<String, dynamic>);
}

/// all : 40

class Clouds {
  int? all;
  Clouds({
    this.all,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'all': all,
    };
  }

  factory Clouds.fromMap(Map<String, dynamic> map) {
    return Clouds(
      all: map['all'] != null ? map['all'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Clouds.fromJson(String source) => Clouds.fromMap(json.decode(source) as Map<String, dynamic>);
}



/// temp : 18.73
/// feels_like : 17.94
/// temp_min : 17.67
/// temp_max : 20.4
/// pressure : 1023
/// humidity : 49

class Main {
  double? temp;
  double? feelsLike;
  int? pressure;
  int? humidity;
  Main({
    this.temp,
    this.feelsLike,
    this.pressure,
    this.humidity,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'temp': temp,
      'feelsLike': feelsLike,
      'pressure': pressure,
      'humidity': humidity,
    };
  }

  factory Main.fromMap(Map<String, dynamic> map) {
    return Main(
      temp: map['temp'] != null ? map['temp'] as double : null,
      feelsLike: map['feelsLike'] != null ? map['feelsLike'] as double : null,
      pressure: map['pressure'] != null ? map['pressure'] as int : null,
      humidity: map['humidity'] != null ? map['humidity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Main.fromJson(String source) => Main.fromMap(json.decode(source) as Map<String, dynamic>);
}

/// id : 802
/// main : "Clouds"
/// description : "구름조금"
/// icon : "03d"

class Weather {
  int? id;
  String? main;
  String? description;
  String? icon;
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'main': main,
      'description': description,
      'icon': icon,
    };
  }

  factory Weather.fromMap(Map<String, dynamic> map) {
    return Weather(
      id: map['id'] != null ? map['id'] as int : null,
      main: map['main'] != null ? map['main'] as String : null,
      description: map['description'] != null ? map['description'] as String : null,
      icon: map['icon'] != null ? map['icon'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Weather.fromJson(String source) => Weather.fromMap(json.decode(source) as Map<String, dynamic>);
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
