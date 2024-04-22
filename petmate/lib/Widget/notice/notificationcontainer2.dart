import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class NotificationContainer2 extends StatefulWidget {
  const NotificationContainer2({super.key});

  @override
  State<NotificationContainer2> createState() => _NotificationContainer2State();
}

class _NotificationContainer2State extends State<NotificationContainer2> {
  bool state = false;
  bool state2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 5),
          child: Text(
            '어제',
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
                      color: Color(0x26000000),
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
                  child: Image.asset('assets/alert/note (20).png')),
              Positioned(
                  left: 45,
                  top: 23,
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
                  left: 80,
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
