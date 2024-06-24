import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AreaModel {
  Status? status;
  List<Results>? resulst;
  AreaModel({
    this.status,
    this.resulst,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status?.toMap(),
      'resulst': resulst?.map((x) => x.toMap()).toList(),
    };
  }

  factory AreaModel.fromMap(Map<String, dynamic> map) {
    return AreaModel(
      status: map['status'] != null
          ? Status.fromMap(map['status'] as Map<String, dynamic>)
          : null,
      resulst: map['resulst'] != null
          ? List<Results>.from(
              (map['resulst'] as List<int>).map<Results?>(
                (x) => Results.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AreaModel.fromJson(String source) =>
      AreaModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Status {
  int? code;
  String? name;
  String? message;
  Status({
    this.code,
    this.name,
    this.message,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
      'message': message,
    };
  }

  factory Status.fromMap(Map<String, dynamic> map) {
    return Status(
      code: map['code'] != null ? map['code'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      message: map['message'] != null ? map['message'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Status.fromJson(String source) =>
      Status.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Results {
  String? name;
  Code? code;
  Region? region;
  Results({
    this.name,
    this.code,
    this.region,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'code': code?.toMap(),
      'region': region?.toMap(),
    };
  }

  factory Results.fromMap(Map<String, dynamic> map) {
    return Results(
      name: map['name'] != null ? map['name'] as String : null,
      code: map['code'] != null
          ? Code.fromMap(map['code'] as Map<String, dynamic>)
          : null,
      region: map['region'] != null
          ? Region.fromMap(map['region'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Results.fromJson(String source) =>
      Results.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Code {
  String? id;
  String? type;
  String? mappingId;
  Code({
    this.id,
    this.type,
    this.mappingId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'type': type,
      'mappingId': mappingId,
    };
  }

  factory Code.fromMap(Map<String, dynamic> map) {
    return Code(
      id: map['id'] != null ? map['id'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      mappingId: map['mappingId'] != null ? map['mappingId'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Code.fromJson(String source) =>
      Code.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Region {
  Area? area0;
  Area? area1;
  Area? area2;
  Area? area3;
  Area? area4;
  Region({
    this.area0,
    this.area1,
    this.area2,
    this.area3,
    this.area4,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'area0': area0?.toMap(),
      'area1': area1?.toMap(),
      'area2': area2?.toMap(),
      'area3': area3?.toMap(),
      'area4': area4?.toMap(),
    };
  }

  factory Region.fromMap(Map<String, dynamic> map) {
    return Region(
      area0: map['area0'] != null
          ? Area.fromMap(map['area0'] as Map<String, dynamic>)
          : null,
      area1: map['area1'] != null
          ? Area.fromMap(map['area1'] as Map<String, dynamic>)
          : null,
      area2: map['area2'] != null
          ? Area.fromMap(map['area2'] as Map<String, dynamic>)
          : null,
      area3: map['area3'] != null
          ? Area.fromMap(map['area3'] as Map<String, dynamic>)
          : null,
      area4: map['area4'] != null
          ? Area.fromMap(map['area4'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Region.fromJson(String source) =>
      Region.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Area {
  String? name;
  Coords? coords;
  Area({
    this.name,
    this.coords,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'coords': coords?.toMap(),
    };
  }

  factory Area.fromMap(Map<String, dynamic> map) {
    return Area(
      name: map['name'] != null ? map['name'] as String : null,
      coords: map['coords'] != null
          ? Coords.fromMap(map['coords'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Area.fromJson(String source) =>
      Area.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Coords {
  Center? center;
  Coords({
    this.center,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'center': center?.toMap(),
    };
  }

  factory Coords.fromMap(Map<String, dynamic> map) {
    return Coords(
      center: map['center'] != null
          ? Center.fromMap(map['center'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Coords.fromJson(String source) =>
      Coords.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Center {
  String? crs;
  double? x;
  double? y;
  Center({
    this.crs,
    this.x,
    this.y,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'crs': crs,
      'x': x,
      'y': y,
    };
  }

  factory Center.fromMap(Map<String, dynamic> map) {
    return Center(
      crs: map['crs'] != null ? map['crs'] as String : null,
      x: map['x'] != null ? map['x'] as double : null,
      y: map['y'] != null ? map['y'] as double : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Center.fromJson(String source) =>
      Center.fromMap(json.decode(source) as Map<String, dynamic>);
}
