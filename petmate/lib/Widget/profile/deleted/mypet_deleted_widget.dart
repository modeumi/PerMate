import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Util/textstyles.dart';
import 'package:petmate/Widget/circle_container.dart';
import 'package:petmate/Widget/custom_container.dart';
import 'package:petmate/Widget/profile/deleted/co_pet_care.dart';

class MyPetDeletedWidget extends StatefulWidget {
  const MyPetDeletedWidget({super.key});

  @override
  State<MyPetDeletedWidget> createState() => _MyPetDeletedWidgetState();
}

class _MyPetDeletedWidgetState extends State<MyPetDeletedWidget> {
  List<bool> deletedCheck = List.generate(3, (index) => false);
  bool state2 = false;
  bool isChecked = false;

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
        for (int i = 0; i < 3; i++)
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: CustomContainer(
                    width: 344.w,
                    height: 80.h,
                    shadow_color: Color(0x26000000)),
              ),
              Positioned(
                top: 32.h,
                left: 11.w,
                child: Container(
                  width: 20.w,
                  height: 20.h,
                  child: GestureDetector(
                      onTap: () {
                        setState(() {
                          deletedCheck[i] = !deletedCheck[i];
                        });
                      },
                      child: Image.asset(deletedCheck[i]
                          ? 'assets/alert/check_selected.png'
                          : 'assets/alert/check_default.png')),
                ),
              ),
              Positioned(
                left: 38.w,
                top: 13.h,
                child: CircleContainer(
                  width: 60.w,
                  height: 60.h,
                ),
              ),
              Positioned(
                  left: 48.w, top: 23.h, child: Image.asset(Profileimage[i])),
              Positioned(
                left: 112,
                top: 10,
                child: Container(
                  width: 101.w,
                  height: 60.h,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name[i],
                        style: White(14.sp, FontWeight.w600),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Row(
                        children: [
                          Text(
                            type[i],
                            style: White(12.sp, FontWeight.w500),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          Image.asset('assets/edit/Male.png'),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            old[i],
                            style: White(12.sp, FontWeight.w500),
                          ),
                          Text(
                            yymm[i],
                            style: White(12.sp, FontWeight.w500),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Positioned(right: 12.w, top: 10.h, child: CoPetCareWidget()),
              Positioned(
                right: 12.w,
                bottom: 12.h,
                child: Text('        공동육아님과\n공동육아중 입니다.',
                    style: White(10.sp, FontWeight.w500)),
              )
            ],
          ),
      ],
    );
  }
}
