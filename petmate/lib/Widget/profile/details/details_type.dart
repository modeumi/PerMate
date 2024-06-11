import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';

class DetailsAddWidget extends StatefulWidget {
  const DetailsAddWidget({super.key});

  @override
  State<DetailsAddWidget> createState() => _DetailsAddWidgetState();
}

class _DetailsAddWidgetState extends State<DetailsAddWidget> {
  bool state = false;

  Map<String, dynamic> result = {
    '종류': '강아지',
    '품종': '시고르자브종',
    '성별': '남',
    '생일': '2021.04.03',
    '처음만난날': '2021.04.30',
    '몸무게': '10KG',
    '중성화 여부': '했음',
    '중성화 날짜': '2022.04.03',
    '염려 · 보유 질환': '눈 · 질환1',
    '보유 알러지': '알러지1',
    '접종 기록': ['접종명1', '접종명2'],
    '수술 기록': '수술1'
  };

  Widget test(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: White(14, FontWeight.w600)),
        Stack(children: [
          Container(
            width: 320,
            height: 40,
            margin: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: state ? Colors.white.withOpacity(0.2) : Colors.transparent,
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
              margin: EdgeInsets.all(4),
              width: 320,
              height: 40,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x4C000000),
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
            left: 140,
            top: 12,
            child: Text(
              content ?? '',
              style: White(14, FontWeight.w500),
            ),
          )
        ]),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            child: Stack(
              children: [
                Container(
                  width: 344,
                  height: 930,
                  margin: EdgeInsets.all(4),
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
                    margin: EdgeInsets.all(4),
                    width: 344,
                    height: 930,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x4C000000),
                            blurRadius: 10,
                            offset: Offset(2, 2),
                            spreadRadius: 0,
                          )
                        ],
                        color: Color(0x3300287C),
                        borderRadius: BorderRadius.circular(10)),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        for (String key in result.keys)
                          result[key] != null
                              ? test(key, result[key]!)
                              : Container(),
                      ]),
                ),
                SizedBox(
                  height: 55,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
