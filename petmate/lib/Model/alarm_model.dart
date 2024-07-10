class AlarmModel {
  final int id;
  final String title;
  final String time;
  final List<String> days;
  final bool isVibrationOn;
  final bool isSoundOn;

  AlarmModel({
    required this.id,
    required this.title,
    required this.time,
    required this.days,
    required this.isVibrationOn,
    required this.isSoundOn,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'time': time,
      'days': days.join(','),
      'isVibrationOn': isVibrationOn ? 1 : 0,
      'isSoundOn': isSoundOn ? 1 : 0,
    };
  }

  factory AlarmModel.fromJson(Map<String, dynamic> json) {
    return AlarmModel(
      id: json['id'],
      title: json['title'],
      time: json['time'],
      days: (json['days'] as String).split(','),
      isVibrationOn: json['isVibrationOn'] == 1,
      isSoundOn: json['isSoundOn'] == 1,
    );
  }
}
