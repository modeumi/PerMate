import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CalendarController extends GetxController {
  var focusedDay = DateTime.now().obs;
  var selectedDay = DateTime.now().obs;

  void onDaySelected(DateTime selectDay, DateTime focusDay) {
    selectedDay.value = selectDay;
    focusedDay.value = focusDay;
  }
}