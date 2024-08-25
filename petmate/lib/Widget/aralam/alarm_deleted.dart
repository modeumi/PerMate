import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';

class AlarmDeletedWidget extends StatefulWidget {
  const AlarmDeletedWidget({super.key});

  @override
  State<AlarmDeletedWidget> createState() => _AlarmDeletedWidgetState();
}

class _AlarmDeletedWidgetState extends State<AlarmDeletedWidget> {
  final _controllerbutton = ValueNotifier<bool>(false);
  bool _check = false;

  //삭제 체크
  bool deletedCheck = false;
  bool isCheck = false;

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
    return Stack(
      children: [
        Positioned(
          left: 10.w,
          top: 124.h,
          child: CustomContainer(
              width: 344.w, height: 96.h,color: Color(0x3300287C), shadow_color: Color(0x26000000)),
        ),
        Positioned(
          left: 16.w,
          top: 140.h,
          child: Container(
            width: 85.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 20.w,
                  height: 20.h,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        deletedCheck = !deletedCheck;
                      });
                    },
                    child: Image.asset(deletedCheck
                        ? 'assets/alert/check_selected.png'
                        : 'assets/alert/check_default.png'),
                  ),
                ),
                Text('약먹이기',
                    style: TextStyle(
                      color: _controllerbutton.value
                          ? Colors.white
                          : Colors.white.withOpacity(0.6),
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ))
              ],
            ),
          ),
        ),
        Positioned(
            right: 24.w,
            top: 140.h,
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
          left: 24.w,
          top: 175.h,
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
          right: 24.w,
          top: 180.h,
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
                    onChanged: (value) {
                      _check != _check;
                    },
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
