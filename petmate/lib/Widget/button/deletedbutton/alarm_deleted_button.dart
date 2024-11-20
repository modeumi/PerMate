import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/toggle_controller.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/button/deletedbutton/content_deleted_button.dart';

class AlarmDeletedButton extends StatefulWidget {
  const AlarmDeletedButton({super.key});

  @override
  State<AlarmDeletedButton> createState() => _AlarmDeletedButtonState();
}

class _AlarmDeletedButtonState extends State<AlarmDeletedButton> {
  final ToggleButtonController controller = Get.put(ToggleButtonController());
  var opactiyValue = 1.0;

  void Deletedoevrlay(BuildContext context) {
    Future.delayed(Duration(milliseconds: 0), () {
      setState(() {
        opactiyValue = 1.0;
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return ContentDeletedButton(
              title: '삭제하기',
              content: '알람을 삭제할까요?',
              text: '알람을 삭제한 후에는 복구할 수 없어요.',
              sharecontent: '',
              blueText: '삭제하기',
              image: Image.asset('assets/alert/delete(14).png'),
              action: () {},
              active: () {
                Get.back();
              },
            );
          },
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            controller.turnOff();
          },
          child: Stack(
            children: [
              Container(
                width: 168,
                height: 60,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 8,
                      offset: Offset(0, 0),
                      spreadRadius: 2,
                    )
                  ],
                ),
              ),
              Opacity(
                opacity: 0.8,
                child: Container(
                  width: 168,
                  height: 60,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x33000000),
                          blurRadius: 2,
                          offset: Offset(2, 2),
                          spreadRadius: 0,
                        )
                      ],
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Positioned(
                left: 40,
                bottom: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/image_asset/alarm/turnoff.png'),
                    SizedBox(
                      width: 8,
                    ),
                    Text('알람끄기',
                        textAlign: TextAlign.center,
                        style: Black(16, FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 6,
        ),
        GestureDetector(
          onTap: () {
            Deletedoevrlay(context);
          },
          child: Stack(
            children: [
              Container(
                width: 168,
                height: 60,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.8),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      width: 1,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x33000000),
                      blurRadius: 8,
                      offset: Offset(0, 0),
                      spreadRadius: 2,
                    )
                  ],
                ),
              ),
              Opacity(
                opacity: 0.8,
                child: Container(
                  width: 168,
                  height: 60,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x33000000),
                          blurRadius: 2,
                          offset: Offset(2, 2),
                          spreadRadius: 0,
                        )
                      ],
                      color: Colors.white.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Positioned(
                left: 40,
                bottom: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/alert/delete(16).png'),
                    SizedBox(
                      width: 8,
                    ),
                    Text('삭제하기',
                        textAlign: TextAlign.center,
                        style: Black(16, FontWeight.w600)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
