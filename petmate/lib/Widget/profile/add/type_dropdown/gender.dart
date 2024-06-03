import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

class GenderType extends StatefulWidget {
  const GenderType({super.key});

  @override
  State<GenderType> createState() => _GenderTypeState();
}

class _GenderTypeState extends State<GenderType> {
  bool gendercheck = false;
  int button = -1;
  final gender = ['남', '여'];
  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(2, (int i) {
      return GestureDetector(
        onTap: () {
          setState(() {
            if (button == i) {
            } else {
              button = i;
            }
          });
        },
        child: Stack(children: [
          Container(
            width: 154,
            height: 40,
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: button == i ? Colors.white : Colors.transparent,
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
            // child: BlurryContainer(
            //   blur: 12,
            //   elevation: 0,
            //   borderRadius: BorderRadius.circular(10),
            //   child: Container(),
            // ),
          ),
          Opacity(
            opacity: 0.4,
            child: Container(
              margin: EdgeInsets.all(4),
              width: 154,
              height: 40,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: button == i
                          ? Colors.white.withOpacity(0.2)
                          : Color(0x4C000000),
                      blurRadius: 2,
                      offset: Offset(0, 0),
                      spreadRadius: 0,
                    )
                  ],
                  color: Color(0x3300287C),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Positioned(
            left: 71,
            top: 12,
            child: Text(
              gender[i],
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: button == i ? Color(0xFF303030) : Colors.white,
                  fontFamily: 'Pretendard'),
            ),
          )
        ]),
      );
    }));
  }
}
