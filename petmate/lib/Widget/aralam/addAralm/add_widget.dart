import 'package:alarm/alarm.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/button/save_button.dart';
import 'package:petmate/Widget/aralam/addAralm/aralm_timepicker.dart';
import 'package:petmate/Widget/aralam/addAralm/weekselected.dart';
import 'package:petmate/Widget/button/alarm_toggle.dart';

class AddAlarmWidget extends StatefulWidget {
  const AddAlarmWidget({super.key, this.alarmSettings});

  final AlarmSettings? alarmSettings;

  @override
  State<AddAlarmWidget> createState() => _AddAlarmWidgetState();
}

class _AddAlarmWidgetState extends State<AddAlarmWidget> {
  final _controllerbutton = ValueNotifier<bool>(false);
  
  late DateTime selectedDateTime;
  late bool loopAudio;
  late bool vibrate;
  late double? volume;
  late String assetAudio;

  Future<void> checkAndroidScheduleExactAlarmPermission() async {
    final status = await Permission.scheduleExactAlarm.status;
    print('Schedule exact alarm permission: $status.');
    if (status.isDenied) {
      print('Requesting schedule exact alarm permission...');
      final res = await Permission.scheduleExactAlarm.request();
      print(
          'Schedule exact alarm permission ${res.isGranted ? '' : 'not'} granted.');
    }
  }

//   final alarmSettings = AlarmSettings(
//   id: 42,
//   dateTime: ,
//   assetAudioPath: 'assets/alarm.mp3',
//   loopAudio: true,
//   vibrate: true,
//   volume: 0.8,
//   fadeDuration: 3.0,
//  notificationSettings: const NotificationActionSettings(
//     title: 'This is the title',
//     body: 'This is the body',
//     stopButton: true,
//     icon: 'notification_icon',
//   ),
//   warningNotificationOnKill: Platform.isAndroid,
// );
  // void main() {
  //   final alarm = AlarmModel(
  //       id: 1,
  //       title: '아침 알람',
  //       time: "7:00",
  //       days: ["월", "수", "금"],
  //       isVibrationOn: true,
  //       isSoundOn: true);

  //   final jsonString = alarm.toJson();
  //   print(jsonString);

  //   final newAlarm = AlarmModel.fromJson(jsonString);
  //   print(newAlarm.title);
  // }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 344.w,
          height: 481.h,
          margin: EdgeInsets.all(1),
          decoration: BoxDecoration(
            color: Colors.transparent,
            border: GradientBoxBorder(
              width: 1.w,
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.2)
                ],
              ),
            ),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: BlurryContainer(
            blur: 12,
            elevation: 0,
            borderRadius: BorderRadius.circular(10.r),
            child: Container(),
          ),
        ),
        Opacity(
          opacity: 0.4,
          child: Container(
            margin: EdgeInsets.all(3),
            width: 344.w,
            height: 481.h,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x4C000000),
                    blurRadius: 1,
                    offset: Offset(1, 1),
                    spreadRadius: 0,
                  )
                ],
                color: Color(0x3300287C),
                borderRadius: BorderRadius.circular(10.r)),
          ),
        ),
        Positioned(
          top: 12.h,
          left: 12.w,
          child: Text(
            '알람추가',
            style: White(16.sp, FontWeight.w600),
          ),
        ),
        Positioned(
          right: 12.w,
          top: 12.h,
          child: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Image.asset('assets/image_asset/alarm/close.png'),
          ),
        ),
        Positioned(top: 48.h, left: 79.w, child: AralmTimepicker()),
        Positioned(
          top: 164.h,
          left: 12.w,
          child: Text(
            '이름',
            style: White(16.sp, FontWeight.w600),
          ),
        ),
        Positioned(
          top: 173.h,
          left: 12.w,
          child: Container(
            width: 300.w,
            height: 44.h,
            child: TextField(
              textAlign: TextAlign.start,
              decoration: InputDecoration(
                hintText: '알람 이름/설명/내용 입력',
                hintStyle: whiteOpacity(14.sp, FontWeight.w600),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white.withOpacity(0.6)),
                ),
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.fromLTRB(0, 12, 0, 0),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: TextStyle(color: Colors.white, decorationThickness: 0),
              cursorColor: Colors.white,
              cursorWidth: 2.w,
            ),
          ),
        ),
        Positioned(
          top: 234.h,
          left: 12.w,
          child: Text(
            '요일',
            style: White(16.sp, FontWeight.w600),
          ),
        ),
        Positioned(
            top: 263.h,
            left: 12.w,
            child: Container(width: 321.w, child: SelectWeekWidget())),
        Positioned(
          top: 319.h,
          left: 12.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '알람음',
                style: White(16.sp, FontWeight.w600),
              ),
              Text(
                '기본',
                style: White(12.sp, FontWeight.w500),
              ),
            ],
          ),
        ),
        Positioned(top: 324.h, right: 12.w, child: ToggleButtonWidget()),
        Positioned(
          top: 374.h,
          left: 12.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '진동',
                style: White(16.sp, FontWeight.w600),
              ),
              ValueListenableBuilder<bool>(
                  valueListenable: _controllerbutton,
                  builder: (context, value, child) {
                    return Text(
                      value ? '사용함' : '사용 안함',
                      style: White(12.sp, FontWeight.w500),
                    );
                  })
            ],
          ),
        ),
        Positioned(
            top: 379.h,
            right: 12.w,
            child: Container(child: ToggleButtonWidget())),
        Positioned(
          bottom: -4.h,
          left: 12.w,
          child: SaveButton(
            content: '저장',
            action: () async {
              Get.back();
            },
          ),
        )
      ],
    );
  }
}
