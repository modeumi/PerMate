import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';
import 'package:table_calendar/table_calendar.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // CustomContainer(
        //   width: 344.w,
        //   height: 146.h,
        //   shadow_color: Color(0x26000000),
        // ),
        SizedBox(
          width: 360,
          child: TableCalendar(
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
                  formatButtonVisible: false,
                  titleCentered: true,
                  leftChevronVisible: false,
                  rightChevronVisible: false),
              focusedDay: DateTime.now(),
              firstDay: DateTime.utc(1900, 1, 1),
              lastDay: DateTime(2300, 12, 31)),
        )
      ],
    );
  }
}
