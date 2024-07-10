import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:petmate/Controller/weather_controller.dart';
import 'package:petmate/Model/area_model.dart';
import 'package:petmate/Util/textstyles.dart';

class AreaData extends StatelessWidget {
  final WeatherController weatherController = Get.put(WeatherController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: weatherController.getArea(),
      builder: (context, snapshot) {
        if (snapshot.hasError || !snapshot.hasData) {
          return CircularProgressIndicator(
            strokeWidth: 1,
            color: Colors.transparent,
          );
        } else {
          List ll = snapshot.data as List;
          return Text(ll[2], style: White(10.sp, FontWeight.w600));
        }
      },
    );
  }
}
