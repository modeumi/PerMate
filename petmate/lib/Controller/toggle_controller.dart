import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ToggleButtonController extends GetxController {
  final ValueNotifier<bool> controllerButton = ValueNotifier<bool>(false);

  void toggleSwitch() {
    controllerButton.value = !controllerButton.value;
  }

  void turnOff() {
    controllerButton.value = false;
  }
}
