import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:petmate/Controller/calender_controller.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  final CalendarController calendarController = Get.put(CalendarController());
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TableCalendar(
          locale: 'ko_KR',
          calendarBuilders: CalendarBuilders(
            dowBuilder: (context, day) {
              switch (day.weekday) {
                case 1:
                  return Center(
                    child: Text('월', style: White(12.sp, FontWeight.w600)),
                  );
                case 2:
                  return Center(
                    child: Text('화', style: White(12.sp, FontWeight.w600)),
                  );
                case 3:
                  return Center(
                    child: Text('수', style: White(12.sp, FontWeight.w600)),
                  );
                case 4:
                  return Center(
                    child: Text('목', style: White(12.sp, FontWeight.w600)),
                  );
                case 5:
                  return Center(
                    child: Text('금', style: White(12.sp, FontWeight.w600)),
                  );
                case 6:
                  return Center(
                    child: Text('토', style: White(12.sp, FontWeight.w600)),
                  );
                case 7:
                  return Center(
                    child: Text(
                      '일',
                      style: White(12.sp, FontWeight.w600),
                    ),
                  );
              }
            },
          ),
          headerStyle: HeaderStyle(
              leftChevronIcon:
                  Image.asset('assets/image_asset/record_screen/left.png'),
              rightChevronIcon:
                  Image.asset('assets/image_asset/record_screen/right.png'),
              leftChevronPadding: EdgeInsets.fromLTRB(12, 0, 0, 0),
              rightChevronPadding: EdgeInsets.fromLTRB(0, 0, 10, 0),
              leftChevronMargin: EdgeInsets.fromLTRB(12, 0, 0, 0),
              rightChevronMargin: EdgeInsets.fromLTRB(0, 0, 12, 0),
              formatButtonVisible: false,
              titleTextStyle: White(20.sp, FontWeight.w600),
              titleTextFormatter: (date, locale) =>
                  DateFormat.MMMM(locale).format(date),
              titleCentered: true,
              leftChevronVisible: true,
              rightChevronVisible: true),
          focusedDay: calendarController.focusedDay.value, // 관찰 가능한 변수 사용
          onDaySelected: (selectedDay, focusedDay) {
            calendarController.focusedDay.value =
                focusedDay; //날짜 선택 시 focusedDay 업데이트
          },
          selectedDayPredicate: (day) {
            // 선택된 날짜와 일치하는지 확인
            return isSameDay(calendarController.selectedDay.value, day);
          },
          calendarFormat: _calendarFormat,
          availableCalendarFormats: const {
            CalendarFormat.month: '한달',
            CalendarFormat.week: '1주'
          },
          onFormatChanged: (format) {
            setState(() {
              _calendarFormat = format;
            });
          },
          calendarStyle: CalendarStyle(
              tablePadding: EdgeInsets.fromLTRB(12, 15, 12, 0),
              outsideTextStyle: whiteOpacity(20.sp, FontWeight.w600),
              weekendTextStyle: White(20.sp, FontWeight.w600),
              selectedTextStyle: Black(20.sp, FontWeight.w600),
              rangeHighlightColor: Colors.white,
              selectedDecoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.white),
              defaultTextStyle: White(20.sp, FontWeight.w600)),
          firstDay: DateTime.utc(1900, 1, 1),
          lastDay: DateTime(2300, 12, 31)),
    );
  }
}
