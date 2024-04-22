import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class NotificationWidget extends StatefulWidget {
  const NotificationWidget({super.key});

  @override
  State<NotificationWidget> createState() => _NotificationWidgetState();
}

class _NotificationWidgetState extends State<NotificationWidget> {
  bool state = false;
  bool state2 = false;
  final text = ['기록', '정보', '거래', '모임'];
  final image = [
    'assets/alert/note (16).png',
    'assets/alert/information(16).png',
    'assets/alert/trade(16).png',
    'assets/alert/group(16).png',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Container(
        width: double.infinity,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          for (int i = 0; i < 4; i++)
            Stack(
              children: [
                Opacity(
                  opacity: 0.4,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                    width: 80,
                    height: 40,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x26000000),
                            blurRadius: 4,
                            offset: Offset(2, 2),
                          )
                        ],
                        color: Color(0x26000000),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
                Container(
                  width: 80,
                  height: 40,
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                  decoration: BoxDecoration(
                    color: state2
                        ? Colors.white.withOpacity(0.2)
                        : Colors.transparent,
                    border: GradientBoxBorder(
                      width: 1,
                      gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.5),
                          Colors.white.withOpacity(0.20000000298023224)
                        ],
                      ),
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: state2
                      ? Container()
                      : BlurryContainer(
                          blur: 12,
                          elevation: 0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(),
                        ),
                ),
                Positioned(left: 18, top: 22, child: Image.asset(image[i])),
                Positioned(
                    left: 40,
                    top: 20,
                    child: Opacity(
                      opacity: 0.6,
                      child: Text(
                        text[i],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )),
              ],
            ),
        ]),
      ),
    );
  }
}
