import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:petmate/Controller/weather_controller.dart';
import 'package:petmate/Model/air_model.dart';
import 'package:petmate/Util/textstyles.dart';

class AirDataWidget extends StatelessWidget {
  final WeatherController weatherController = Get.put(WeatherController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AirModel?>(
      future: weatherController.getAir(),
      builder: (context, snapshot) {
        if (snapshot.hasError || !snapshot.hasData) {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        } else {
          AirModel airdata = snapshot.data!;
          return Stack(
            children: [
              Positioned(
                right: 75,
                top: 38,
                bottom: 70,
                child: Container(
                  width: 58.w,
                  height: 64.h,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                          opacity: 0.6,
                          child: Text('미세 먼지',
                              style: White(10.sp, FontWeight.w500))),
                      weatherController.getairText(airdata.pm2_5),
                      IntrinsicWidth(
                        child: Container(
                          height: 16.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            color: weatherController.getairColor(airdata.pm2_5),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text('${airdata.pm2_5.round().toDouble()}',
                                textAlign: TextAlign.center,
                                style: White(10.sp, FontWeight.w500)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                right: 9,
                top: 38,
                bottom: 70,
                child: Container(
                  width: 58.w,
                  height: 64.h,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Opacity(
                          opacity: 0.6,
                          child: Text('초미세 먼지',
                              style: White(10.sp, FontWeight.w600))),
                      weatherController.getairText(airdata.pm10),
                      IntrinsicWidth(
                        child: Container(
                            height: 16.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color:
                                  weatherController.getairColor(airdata.pm10),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8),
                              child: Text('${airdata.pm10.round().toDouble()}',
                                  textAlign: TextAlign.center,
                                  style: White(10.sp, FontWeight.w500)),
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
