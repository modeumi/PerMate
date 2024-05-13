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
  List<String> type = [
    '종류',
    '품종',
    '성별',
    '생일',
    '처음만난날',
    '몸무게',
    '중성화 여부',
    '중성화 날짜',
    '염려 · 보유 질환',
    '보유 알러지',
    '접종 기록',
    '수술 기록'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            child: Stack(children: [
              Container(
                width: 344,
                height: 1010,
                margin: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.transparent,
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
                child: BlurryContainer(
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
                  height: 1010,
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
                    Text(type[0], style: White(14, FontWeight.w600)),
                    Stack(children: [
                      Container(
                        width: 320,
                        height: 40,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
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
                        child: BlurryContainer(
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
                          '강아지',
                          style: White(14, FontWeight.w500),
                        ),
                      )
                    ]),
                    SizedBox(
                      height: 12,
                    ),
                    Text('품종*', style: White(14, FontWeight.w600)),
                    Stack(children: [
                      Container(
                        width: 320,
                        height: 40,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
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
                        child: BlurryContainer(
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
                        left: 125,
                        top: 12,
                        child: Text(
                          '시고르자브종',
                          style: White(14, FontWeight.w500),
                        ),
                      )
                    ]),
                    SizedBox(
                      height: 16,
                    ),
                    Text('성별*', style: White(14, FontWeight.w600)),
                    Stack(children: [
                      Container(
                        width: 320,
                        height: 40,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
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
                        child: BlurryContainer(
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
                        left: 155,
                        top: 12,
                        child: Text(
                          '남',
                          style: White(14, FontWeight.w500),
                        ),
                      )
                    ]),
                    SizedBox(
                      height: 16,
                    ),
                    Text('생일*', style: White(14, FontWeight.w600)),
                    Stack(children: [
                      Container(
                        width: 320,
                        height: 40,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
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
                        child: BlurryContainer(
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
                        left: 125,
                        top: 12,
                        child: Text(
                          '2021.04.03',
                          style: White(14, FontWeight.w500),
                        ),
                      )
                    ]),
                    SizedBox(
                      height: 16,
                    ),
                    Text('처음 만난 날', style: White(14, FontWeight.w600)),
                    Stack(children: [
                      Container(
                        width: 320,
                        height: 40,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
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
                        child: BlurryContainer(
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
                        left: 125,
                        top: 12,
                        child: Text(
                          '2021.04.03',
                          style: White(14, FontWeight.w500),
                        ),
                      )
                    ]),
                    SizedBox(
                      height: 16,
                    ),
                    Text('몸무게', style: White(14, FontWeight.w600)),
                    Stack(children: [
                      Container(
                        width: 320,
                        height: 40,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
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
                        child: BlurryContainer(
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
                          '10 KG',
                          style: White(14, FontWeight.w500),
                        ),
                      )
                    ]),
                    SizedBox(
                      height: 16,
                    ),
                    Text('중성화 여부*', style: White(14, FontWeight.w600)),
                    for (int i = 0; i < 3; i++)
                      Stack(children: [
                        Container(
                          width: 100,
                          height: 40,
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
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
                          child: BlurryContainer(
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
                            width: 100,
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
                          child: Text(
                            '했음',
                            style: White(14, FontWeight.w500),
                          ),
                        )
                      ]),
                    SizedBox(
                      height: 16,
                    ),
                    Text('중성화 날짜', style: White(14, FontWeight.w600)),
                    Stack(children: [
                      Container(
                        width: 320,
                        height: 40,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
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
                        child: BlurryContainer(
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
                        left: 125,
                        top: 12,
                        child: Text(
                          '2022.04.03',
                          style: White(14, FontWeight.w500),
                        ),
                      )
                    ]),
                    SizedBox(
                      height: 16,
                    ),
                    Text('염려 · 보유 질환', style: White(14, FontWeight.w600)),
                    Stack(children: [
                      Container(
                        width: 320,
                        height: 40,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
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
                        child: BlurryContainer(
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
                        left: 45,
                        top: 12,
                        child: Text(
                          '눈 · 질환1',
                          style: White(14, FontWeight.w500),
                        ),
                      )
                    ]),
                    SizedBox(
                      height: 16,
                    ),
                    Text('보유 알러지', style: White(14, FontWeight.w600)),
                    Stack(children: [
                      Container(
                        width: 320,
                        height: 40,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
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
                        child: BlurryContainer(
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
                        left: 45,
                        top: 12,
                        child: Text(
                          '알러지1',
                          style: White(14, FontWeight.w500),
                        ),
                      )
                    ]),
                    SizedBox(
                      height: 16,
                    ),
                    Text('접종 기록', style: White(14, FontWeight.w600)),
                    Stack(children: [
                      Container(
                        width: 320,
                        height: 40,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
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
                        child: BlurryContainer(
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
                        left: 45,
                        top: 12,
                        child: Text(
                          '접종명1',
                          style: White(14, FontWeight.w500),
                        ),
                      )
                    ]),
                    SizedBox(
                      height: 16,
                    ),
                    Text('수술 기록', style: White(14, FontWeight.w600)),
                    Stack(children: [
                      Container(
                        width: 320,
                        height: 40,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
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
                        child: BlurryContainer(
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
                        left: 45,
                        top: 12,
                        child: Text(
                          '수술1',
                          style: White(14, FontWeight.w500),
                        ),
                      )
                    ]),
                  ],
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 55,
          )
        ],
      ),
    );
  }
}
