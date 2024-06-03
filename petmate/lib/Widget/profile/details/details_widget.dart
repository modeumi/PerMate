import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class DetailsProfileWidget extends StatefulWidget {
  const DetailsProfileWidget({super.key});

  @override
  State<DetailsProfileWidget> createState() => _DetailsProfileWidgetState();
}

class _DetailsProfileWidgetState extends State<DetailsProfileWidget> {
  bool state2 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Positioned(
              child: Stack(
                children: [
                  Container(
                    width: 96,
                    height: 96,
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      color:
                          state2 ? Colors.white.withOpacity(0.2) : Colors.white,
                      border: GradientBoxBorder(
                        width: 1,
                        gradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.2)
                          ],
                        ),
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: state2
                        ? Container()
                        : BlurryContainer(
                            blur: 12,
                            elevation: 0,
                            borderRadius: BorderRadius.circular(50),
                            child: Container(),
                          ),
                  ),
                  Opacity(
                    opacity: 0.4,
                    child: Container(
                      margin: EdgeInsets.all(2),
                      width: 96,
                      height: 96,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color(0x26000000),
                              blurRadius: 2,
                              offset: Offset(4, 4),
                              spreadRadius: 0,
                            )
                          ],
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  Positioned(
                      left: 16,
                      top: 16,
                      right: 16,
                      child: Image.asset(
                          'assets/image_asset/pet_upload/animal_profile (2).png'))
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
            padding: const EdgeInsets.only(left: 48, right: 52),
            child: Text(
              '복실복실해',
              style: White(16, FontWeight.w600),
            )),
        SizedBox(
          height: 14,
        ),
      ],
    );
  }
}
