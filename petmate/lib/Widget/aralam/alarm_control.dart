import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/button/alarm_toggle.dart';

class AlarmControlWidget extends StatefulWidget {
  const AlarmControlWidget({super.key});

  @override
  State<AlarmControlWidget> createState() => _AlarmControlWidgetState();
}

class _AlarmControlWidgetState extends State<AlarmControlWidget> {
  bool state2 = false;

  final _controllerbutton = ValueNotifier<bool>(false);
  bool _check = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controllerbutton.addListener(() {
      setState(() {
        if (_controllerbutton.value) {
          _check = true;
        } else {
          _check = false;
        }
      });
    });
  }

  @override
  void dispose() {
    _controllerbutton.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 10),
          child: Container(
            width: 36,
            height: 30,
            child: Text('오늘',
                textAlign: TextAlign.center, style: White(16, FontWeight.w600)),
          ),
        ),
        // for (int i = 0; i < 3; i++)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
          child: Stack(
            children: [
              Container(
                width: 344,
                height: 96,
                margin: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  border: GradientBoxBorder(
                    width: 1,
                    gradient: LinearGradient(
                      colors: [
                        Colors.white.withOpacity(0.5),
                        Colors.white.withOpacity(0.2)
                      ],
                    ),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: state2
                    ? Container()
                    : BlurryContainer(
                        blur: 12,
                        elevation: 0,
                        borderRadius: BorderRadius.circular(10),
                        child: Container(),
                      ),
              ),
              Opacity(
                opacity: 0.4,
                child: Container(
                  margin: EdgeInsets.all(3),
                  width: 344,
                  height: 96,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x26000000),
                          blurRadius: 2,
                          offset: Offset(2, 2),
                          spreadRadius: 0,
                        )
                      ],
                      color: Color(0x3300287C),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Positioned(
                  left: 16,
                  top: 16,
                  child: Text('약먹이기',
                      style: TextStyle(
                        color: _controllerbutton.value
                            ? Colors.white
                            : Colors.white.withOpacity(0.6),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w600,
                      ))),
              Positioned(
                  right: 16,
                  top: 16,
                  child: Text(
                    '월,화,수,목,금',
                    style: TextStyle(
                      color: _controllerbutton.value
                          ? Colors.white
                          : Colors.white.withOpacity(0.6),
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              Positioned(
                left: 16,
                bottom: 16,
                child: Container(
                  width: 129,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '오전',
                        style: TextStyle(
                          color: _controllerbutton.value
                              ? Colors.white
                              : Colors.white.withOpacity(0.6),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '09 : 00',
                        style: TextStyle(
                          color: _controllerbutton.value
                              ? Colors.white
                              : Colors.white.withOpacity(0.6),
                          fontSize: 28,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 16,
                bottom: 16,
                child: Stack(
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
                                color: _controllerbutton.value
                                    ? Color(0xFF2B80FF)
                                    : Color(0xFFC9C9C9),
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
                          controller: _controllerbutton,
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}