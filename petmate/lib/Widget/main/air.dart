import 'package:flutter/material.dart';
import 'package:petmate/Model/air_model.dart';
import 'package:petmate/Util/textstyles.dart';
import '../../Controller/air_controller.dart';

class AirDataWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AirModel?>(
      future: getAir(),
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
              Container(),
              Positioned(
                right: 75,
                top: 38,
                bottom: 70,
                child: Container(
                  width: 58,
                  height: 64,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Opacity(
                          opacity: 0.6,
                          child:
                              Text('미세 먼지', style: White(10, FontWeight.w500))),
                      getairText(airdata.pm2_5),
                      Container(
                        width: 33,
                        height: 16,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: getairColor(airdata.pm2_5),
                        ),
                        child: Text('${airdata.pm2_5.round()}',
                            // '150',
                            textAlign: TextAlign.center,
                            style: White(10, FontWeight.w500)),
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
                  width: 58,
                  height: 64,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Opacity(
                          opacity: 0.6,
                          child: Text('초미세 먼지',
                              style: White(10, FontWeight.w600))),
                      getairText(airdata.pm10),
                      Container(
                          width: 28,
                          height: 16,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: getairColor(airdata.pm10),
                          ),
                          child: Text('${airdata.pm10.round()}',
                              // '150',
                              textAlign: TextAlign.center,
                              style: White(10, FontWeight.w500))),
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

Color getairColor(double value) {
  if (value <= 30) {
    return Color(0xFF397CFF);
  } else if (value <= 80) {
    return Color(0xFF62FF7B);
  } else if (value <= 150) {
    return Color(0xFFFFDC62);
  } else if (value <= 151) {
    return Color(0xFFFF6262);
  } else {
    return Color(0xFF397CFF);
  }
}

Text getairText(double value) {
  if (value <= 30) {
    return Text(
      '좋음',
      style: White(14, FontWeight.w600),
    );
  } else if (value <= 80) {
    return Text('보통', style: White(14, FontWeight.w600));
  } else if (value <= 150) {
    return Text('나쁨', style: White(14, FontWeight.w600));
  } else if (value <= 151) {
    return Text('매우나쁨', style: White(14, FontWeight.w600));
  } else {
    return Text('좋음', style: White(14, FontWeight.w600));
  }
}
