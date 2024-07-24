import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:petmate/Controller/weather_controller.dart';
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
          return AutoSizeText(ll[2],
              minFontSize: 10,
              style: White(
                10.sp,
                FontWeight.w600,
              ));
        }
      },
    );
  }
}
