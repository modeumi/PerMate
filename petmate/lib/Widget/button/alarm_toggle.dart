import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Controller/toggle_controller.dart';

class ToggleButtonWidget extends StatefulWidget {
  const ToggleButtonWidget({
    super.key,
  });

  @override
  State<ToggleButtonWidget> createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {
  final ToggleButtonController controller = Get.put(ToggleButtonController());
  bool check = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: 0.9,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0x3300287C),
              border: GradientBoxBorder(
                width: 1,
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.2)
                  ],
                ),
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: AdvancedSwitch(
              width: 48,
              height: 24,
              thumb: Container(
                width: 20,
                height: 20,
                decoration: ShapeDecoration(
                    color: check ? Color(0xFFC9C9C9) : Color(0xFF2B80FF),
                    shape: OvalBorder(),
                    shadows: [
                      BoxShadow(
                        color: Color(0x4C000000),
                        blurRadius: 3,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      )
                    ]),
              ),
              activeColor: Color(0x3300287C),
              inactiveColor: Color(0xff00297C33),
              onChanged: (value) {
                check;
                print(value);
                setState(() {
                  check = !check;
                });
                print(check);
              },
            ),
          ),
        ),
      ],
    );
  }
}
