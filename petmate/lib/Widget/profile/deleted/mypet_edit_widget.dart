import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/View/Profile.dart/edit_detail.dart';
import 'package:petmate/Widget/profile/deleted/co_pet_care.dart';

class MyPetEditWidget extends StatefulWidget {
  const MyPetEditWidget({super.key});

  @override
  State<MyPetEditWidget> createState() => _MyPetEditWidgetState();
}

class _MyPetEditWidgetState extends State<MyPetEditWidget> {
  bool state2 = false;
  final Profileimage = [
    'assets/edit/animal (1).png',
    'assets/edit/animal (2).png',
    'assets/edit/animal (3).png',
  ];

  final name = ['복실복실해', '고양고양해', '토끼토끼해'];
  final type = ['말티푸', '러시안블루', '믹스'];
  final old = ['12살', '1살', '20살'];
  final yymm = ['2021. 04. 03', '2024. 04. 03', '2013. 04. 03'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, top: 10),
          child: Container(
            width: 77,
            height: 29,
            child: Text(
              '내 반려동물',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        for (int i = 0; i < 3; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
            child: GestureDetector(
              onTap: () {
                Get.to(() => EditdetailsPage());
              },
              child: Stack(
                children: [
                  Container(
                    width: 344,
                    height: 80,
                    margin: EdgeInsets.all(1),
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
                  Opacity(
                    opacity: 0.4,
                    child: Container(
                      margin: EdgeInsets.all(3),
                      width: 344,
                      height: 80,
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
                  Positioned(
                    left: 12,
                    top: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset('assets/edit/menu.png'),
                        SizedBox(
                          width: 11,
                        ),
                        Stack(
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              margin: EdgeInsets.all(1),
                              decoration: BoxDecoration(
                                color: state2
                                    ? Colors.white.withOpacity(0.2)
                                    : Colors.white,
                                border: GradientBoxBorder(
                                  width: 1,
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.white.withOpacity(0.5),
                                      Colors.white.withOpacity(0.2)
                                    ],
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: state2
                                  ? Container()
                                  : BlurryContainer(
                                      blur: 12,
                                      elevation: 0,
                                      borderRadius: BorderRadius.circular(30),
                                      child: Container(),
                                    ),
                            ),
                            Opacity(
                              opacity: 0.4,
                              child: Container(
                                margin: EdgeInsets.all(2),
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Color(0x26000000),
                                        blurRadius: 2,
                                        offset: Offset(0, 2),
                                        spreadRadius: 0,
                                      )
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30)),
                              ),
                            ),
                            Positioned(
                                left: 12,
                                top: 10,
                                child: Image.asset(Profileimage[i]))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 112,
                    top: 10,
                    child: Container(
                      width: 101,
                      height: 60,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            name[i],
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            children: [
                              Text(
                                type[i],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w600,
                                  height: 0,
                                ),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Image.asset('assets/edit/Male.png'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                old[i],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Text(
                                yymm[i],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                  fontFamily: 'Pretendard',
                                  fontWeight: FontWeight.w500,
                                  height: 0,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(right: 10, top: 8, child: CoPetCareWidget()),
                  Positioned(
                    right: 12,
                    bottom: 12,
                    child: Text(
                      '        공동육아님과\n공동육아중 입니다.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
      ],
    );
  }
}
