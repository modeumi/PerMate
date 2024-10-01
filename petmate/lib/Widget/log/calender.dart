import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarController extends GetxController {
  var focusedDay = DateTime.now().obs;
  var selectedDay = DateTime.now().obs;

  void onDaySelected(DateTime selectDay, DateTime focusDay) {
    selectedDay.value = selectDay;
    focusedDay.value = focusDay;
  }
}

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    final CalendarController controller = Get.put(CalendarController());
    CalendarFormat _calendarFormat = CalendarFormat.month;

    return Obx(
      () => TableCalendar(
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
              leftChevronPadding: EdgeInsets.fromLTRB(12, 12, 0, 0),
              rightChevronPadding: EdgeInsets.fromLTRB(0, 12, 20, 0),
              leftChevronMargin: EdgeInsets.fromLTRB(12, 6, 0, 0),
              rightChevronMargin: EdgeInsets.fromLTRB(0, 6, 12, 0),
              formatButtonVisible: false,
              titleTextStyle: White(20.sp, FontWeight.w600),
              titleTextFormatter: (date, locale) =>
                  DateFormat.MMMM(locale).format(date),
              titleCentered: true,
              leftChevronVisible: true,
              rightChevronVisible: true),
          focusedDay: controller.focusedDay.value, // 관찰 가능한 변수 사용
          onDaySelected: (selectedDay, focusedDay) {
            controller.focusedDay.value = focusedDay; //날짜 선택 시 focusedDay 업데이트
          },
          selectedDayPredicate: (day) {
            // 선택된 날짜와 일치하는지 확인
            return isSameDay(controller.selectedDay.value, day);
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
              tablePadding: EdgeInsets.fromLTRB(12, 8, 12, 0),
              cellPadding: EdgeInsets.fromLTRB(0, 8, 0, 0),
              outsideTextStyle: whiteOpacity(20.sp, FontWeight.w600),
              weekendTextStyle: White(20.sp, FontWeight.w600),
              selectedTextStyle: Black(20.sp, FontWeight.w600),
              rangeHighlightColor: Colors.black,
              defaultTextStyle: White(20.sp, FontWeight.w600)),
          firstDay: DateTime.utc(1900, 1, 1),
          lastDay: DateTime(2300, 12, 31)),
    );
  }
}
