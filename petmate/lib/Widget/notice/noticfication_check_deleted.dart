import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class NotificationCheckDeleted extends StatefulWidget {
  const NotificationCheckDeleted({super.key});

  @override
  State<NotificationCheckDeleted> createState() =>
      _NotificationCheckDeletedState();
}

class _NotificationCheckDeletedState extends State<NotificationCheckDeleted> {
  bool state2 = false;
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 10,
          ),
          child: Text(
            '오늘',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        for (int i = 1; i < 4; i++)
          Stack(
            children: [
              Opacity(
                opacity: 0.05,
                child: Container(
                  margin: EdgeInsets.all(8),
                  width: double.infinity,
                  height: 88,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(3, 3),
                        )
                      ],
                      color: Color(0x3300287C),
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              Container(
                width: double.infinity,
                height: 88,
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: state2
                      ? Colors.white.withOpacity(0.2)
                      : Colors.transparent,
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
              Positioned(
                  left: 18,
                  top: 23,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      child: Image.asset(isChecked
                          ? 'assets/alert/check_selected.png'
                          : 'assets/alert/check_default.png'))),
              Positioned(
                  left: 43,
                  top: 22,
                  child: Image.asset('assets/alert/note (20).png')),
              Positioned(
                  left: 68,
                  top: 21,
                  child: Text(
                    '기록',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              Positioned(
                  left: 100,
                  top: 25,
                  child: Opacity(
                    opacity: 0.6,
                    child: Text(
                      '·  오후 5:00',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )),
              Positioned(
                  left: 18,
                  top: 50,
                  child: Text(
                    '‘공동육아’ 님이 ‘복실복실해’ 의 일지에 목욕기록을 남겼어요. ',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                    ),
                  )),
            ],
          ),
      ],
    );
  }
}
