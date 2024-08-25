import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:dropdown_model_list/dropdown_model_list.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Main/mainpage.dart';
import 'package:petmate/Widget/custom_widget/custom_container.dart';

class detailsAddWidget extends StatefulWidget {
  const detailsAddWidget({super.key});

  @override
  State<detailsAddWidget> createState() => _detailsAddWidgetState();
}

class _detailsAddWidgetState extends State<detailsAddWidget> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(children: [
          CustomContainer(
              width: 344.w,
              height: 940.h,
              color: Color(0x3300287C),
              shadow_color: Color(0x26000000)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('종류', style: White(14, FontWeight.w600)),
              Stack(children: [
                GlassContainer(
                  width: 320.w,
                  height: 40.h,
                  margin: EdgeInsets.all(8),
                  color: Color(0x3300287C),
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.10, 0.60, 0.40, 0.0],
                  ),
                  blur: 12,
                  borderRadius: BorderRadius.circular(10),
                  borderWidth: 1.0,
                  elevation: 0,
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
              Text('품종', style: White(14, FontWeight.w600)),
              Stack(children: [
                GlassContainer(
                  width: 320.w,
                  height: 40.h,
                  margin: EdgeInsets.all(8),
                  color: Color(0x3300287C),
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.10, 0.60, 0.40, 0.0],
                  ),
                  blur: 12,
                  borderRadius: BorderRadius.circular(10),
                  borderWidth: 1.0,
                  elevation: 0,
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
              Text('성별', style: White(14, FontWeight.w600)),
              Stack(children: [
                GlassContainer(
                  width: 320.w,
                  height: 40.h,
                  margin: EdgeInsets.all(8),
                  color: Color(0x3300287C),
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.10, 0.60, 0.40, 0.0],
                  ),
                  blur: 12,
                  borderRadius: BorderRadius.circular(10),
                  borderWidth: 1.0,
                  elevation: 0,
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
              Text('생일', style: White(14, FontWeight.w600)),
              Stack(children: [
                GlassContainer(
                  width: 320.w,
                  height: 40.h,
                  margin: EdgeInsets.all(8),
                  color: Color(0x3300287C),
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.10, 0.60, 0.40, 0.0],
                  ),
                  blur: 12,
                  borderRadius: BorderRadius.circular(10),
                  borderWidth: 1.0,
                  elevation: 0,
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
                GlassContainer(
                  width: 320.w,
                  height: 40.h,
                  margin: EdgeInsets.all(8),
                  color: Color(0x3300287C),
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.10, 0.60, 0.40, 0.0],
                  ),
                  blur: 12,
                  borderRadius: BorderRadius.circular(10),
                  borderWidth: 1.0,
                  elevation: 0,
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
              Text('중성화 여부', style: White(14, FontWeight.w600)),
              Stack(children: [
                GlassContainer(
                  width: 320.w,
                  height: 40.h,
                  margin: EdgeInsets.all(8),
                  color: Color(0x3300287C),
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.10, 0.60, 0.40, 0.0],
                  ),
                  blur: 12,
                  borderRadius: BorderRadius.circular(10),
                  borderWidth: 1.0,
                  elevation: 0,
                ),
                Positioned(
                  left: 145,
                  top: 12,
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
                GlassContainer(
                  width: 320.w,
                  height: 40.h,
                  margin: EdgeInsets.all(8),
                  color: Color(0x3300287C),
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderGradient: LinearGradient(
                    colors: [
                      Colors.white.withOpacity(0.5),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                      Colors.white.withOpacity(0.2),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    stops: [0.10, 0.60, 0.40, 0.0],
                  ),
                  blur: 12,
                  borderRadius: BorderRadius.circular(10),
                  borderWidth: 1.0,
                  elevation: 0,
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
              Container(
                width: 302,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(children: [
                      GlassContainer(
                        width: 320.w,
                        height: 40.h,
                        margin: EdgeInsets.all(8),
                        color: Color(0x3300287C),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.white.withOpacity(0.2),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderGradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.2),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.10, 0.60, 0.40, 0.0],
                        ),
                        blur: 12,
                        borderRadius: BorderRadius.circular(10),
                        borderWidth: 1.0,
                        elevation: 0,
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
                    Stack(children: [
                      GlassContainer(
                        width: 320.w,
                        height: 40.h,
                        margin: EdgeInsets.all(8),
                        color: Color(0x3300287C),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.white.withOpacity(0.2),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderGradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.2),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.10, 0.60, 0.40, 0.0],
                        ),
                        blur: 12,
                        borderRadius: BorderRadius.circular(10),
                        borderWidth: 1.0,
                        elevation: 0,
                      ),
                      Positioned(
                        left: 45,
                        top: 12,
                        child: Text(
                          '관절  · 질환2',
                          style: White(14, FontWeight.w500),
                        ),
                      )
                    ]),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text('보유 알러지', style: White(14, FontWeight.w600)),
              Container(
                width: 263,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Stack(children: [
                      GlassContainer(
                        width: 320.w,
                        height: 40.h,
                        margin: EdgeInsets.all(8),
                        color: Color(0x3300287C),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.white.withOpacity(0.2),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderGradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.2),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.10, 0.60, 0.40, 0.0],
                        ),
                        blur: 12,
                        borderRadius: BorderRadius.circular(10),
                        borderWidth: 1.0,
                        elevation: 0,
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
                    Stack(children: [
                      GlassContainer(
                        width: 320.w,
                        height: 40.h,
                        margin: EdgeInsets.all(8),
                        color: Color(0x3300287C),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.white.withOpacity(0.2),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderGradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.2),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.10, 0.60, 0.40, 0.0],
                        ),
                        blur: 12,
                        borderRadius: BorderRadius.circular(10),
                        borderWidth: 1.0,
                        elevation: 0,
                      ),
                      Positioned(
                        left: 45,
                        top: 12,
                        child: Text(
                          '알러지2',
                          style: White(14, FontWeight.w500),
                        ),
                      )
                    ]),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text('접종 기록', style: White(14, FontWeight.w600)),
              Container(
                width: 265,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(children: [
                      GlassContainer(
                        width: 320.w,
                        height: 40.h,
                        margin: EdgeInsets.all(8),
                        color: Color(0x3300287C),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.white.withOpacity(0.2),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderGradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.2),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.10, 0.60, 0.40, 0.0],
                        ),
                        blur: 12,
                        borderRadius: BorderRadius.circular(10),
                        borderWidth: 1.0,
                        elevation: 0,
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
                    Stack(children: [
                      GlassContainer(
                        width: 320.w,
                        height: 40.h,
                        margin: EdgeInsets.all(8),
                        color: Color(0x3300287C),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.white.withOpacity(0.2),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderGradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.2),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.10, 0.60, 0.40, 0.0],
                        ),
                        blur: 12,
                        borderRadius: BorderRadius.circular(10),
                        borderWidth: 1.0,
                        elevation: 0,
                      ),
                      Positioned(
                        left: 45,
                        top: 12,
                        child: Text(
                          '접종명2',
                          style: White(14, FontWeight.w500),
                        ),
                      )
                    ]),
                  ],
                ),
              ),
              SizedBox(
                height: 16,
              ),
              Text('수술 기록', style: White(14, FontWeight.w600)),
              Container(
                width: 243,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Stack(children: [
                      GlassContainer(
                        width: 320.w,
                        height: 40.h,
                        margin: EdgeInsets.all(8),
                        color: Color(0x3300287C),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.white.withOpacity(0.2),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderGradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.2),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.10, 0.60, 0.40, 0.0],
                        ),
                        blur: 12,
                        borderRadius: BorderRadius.circular(10),
                        borderWidth: 1.0,
                        elevation: 0,
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
                    Stack(children: [
                      GlassContainer(
                        width: 320.w,
                        height: 40.h,
                        margin: EdgeInsets.all(8),
                        color: Color(0x3300287C),
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.white.withOpacity(0.2),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderGradient: LinearGradient(
                          colors: [
                            Colors.white.withOpacity(0.5),
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.2),
                            Colors.white.withOpacity(0.2),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          stops: [0.10, 0.60, 0.40, 0.0],
                        ),
                        blur: 12,
                        borderRadius: BorderRadius.circular(10),
                        borderWidth: 1.0,
                        elevation: 0,
                      ),
                      Positioned(
                        left: 45,
                        top: 12,
                        child: Text(
                          '수술2',
                          style: White(14, FontWeight.w500),
                        ),
                      )
                    ]),
                  ],
                ),
              ),
            ],
          ),
        ]),
      ],
    );
  }
}
