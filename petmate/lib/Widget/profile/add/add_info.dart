import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class AddInfoWidget extends StatefulWidget {
  const AddInfoWidget({super.key});

  @override
  State<AddInfoWidget> createState() => _AddInfoWidgetState();
}

class _AddInfoWidgetState extends State<AddInfoWidget> {
 
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            child: Stack(children: [
              Container(
                width: 344,
                height: 441,
                margin: EdgeInsets.all(1),
                decoration: BoxDecoration(
                  color: state
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
                child: state
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
                  height: 441,
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
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('종류*', style: White(14, FontWeight.w600)),
                    Text('품종*', style: White(14, FontWeight.w600)),
                    Text('성별*', style: White(14, FontWeight.w600)),
                    Text('생일*', style: White(14, FontWeight.w600)),
                    Text('처음 만날 날', style: White(14, FontWeight.w600)),
                  ],
                ),
              ),
            ]),
          )
        ],
      ),
    );
  }
}
