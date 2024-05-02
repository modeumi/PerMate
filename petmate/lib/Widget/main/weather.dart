import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:petmate/Controller/weather_controller.dart';
import 'package:petmate/Util/textstyles.dart';

class WeatherWigdget extends StatefulWidget {
  const WeatherWigdget({
    super.key,
  });

  @override
  State<WeatherWigdget> createState() => _WeatherWigdgetState();
}

class _WeatherWigdgetState extends State<WeatherWigdget> {
  bool state2 = false;

  @override
  Widget build(BuildContext context) {
    Get.put(WeatherController());
    return GetBuilder<WeatherController>(builder: (controller) {
      return Stack(
        children: [
          Container(
            width: double.infinity,
            height: 172,
            margin: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color:
                  state2 ? Colors.white.withOpacity(0.2) : Colors.transparent,
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
              margin: const EdgeInsets.all(8),
              width: double.infinity,
              height: 172,
              decoration: BoxDecoration(
                  boxShadow: [
                    const BoxShadow(
                      color: Color(0x26000000),
                      blurRadius: 2,
                      offset: Offset(1, 1),
                      spreadRadius: 0,
                    )
                  ],
                  color: const Color(0x3300287C),
                  borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Positioned(
            right: 12,
            top: 18,
            child: Container(
              width: 326,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('날씨', style: White(12, FontWeight.w600)),
                  Container(
                    width: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('반송동', style: White(10, FontWeight.w600)),
                        GestureDetector(
                          onTap: () {
                            debugPrint('clicked~~');
                            ();
                          },
                          child: Image.asset(
                            'assets/Main/reset.png',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            left: 20,
            top: 42,
            // child: controller.image,
            child: Image.asset('assets/Main/weather (1).png'),
          ),
          Positioned(
            left: 87,
            top: 42,
            child: Container(
              width: 44,
              height: 64,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                      // '${controller.weatherData.main!.temp!}\u2103',
                      '-30°',
                      textAlign: TextAlign.center,
                      style: White(20, FontWeight.w600)),
                  Text(
                      // '${controller.weatherData.weather![0].description}',
                      '맑음',
                      style: White(16, FontWeight.w600)),
                ],
              ),
            ),
          ),
          Positioned(
            left: 140,
            top: 47,
            child: Container(
              width: 58,
              height: 64,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('강수 확률', style: White(10, FontWeight.w500)),
                  Text('100%', style: White(14, FontWeight.w500)),
                  Container(
                    width: 58,
                    height: 16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFF62BDFF)),
                    child: Text('습도 100%',
                        textAlign: TextAlign.center,
                        style: White(10, FontWeight.w500)),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 90,
            top: 47,
            child: Container(
              width: 58,
              height: 64,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('미세 먼지', style: White(10, FontWeight.w500)),
                  Text(
                      // controller.text,
                      '매우 나쁨',
                      style: White(14, FontWeight.w600)),
                  Container(
                    width: 33,
                    height: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFFF6262),
                    ),
                    child: Text(
                        // '${controller.pm10}',
                        '150',
                        textAlign: TextAlign.center,
                        style: White(10, FontWeight.w600)),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 20,
            top: 47,
            child: Container(
              width: 58,
              height: 64,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('초미세 먼지', style: White(10, FontWeight.w600)),
                  Text(
                      // controller.text,
                      '매우 나쁨',
                      style: White(14, FontWeight.w600)),
                  Container(
                    width: 33,
                    height: 16,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFFF6262),
                    ),
                    child: Text(
                        // '${controller.pm2_5}',
                        '76',
                        textAlign: TextAlign.center,
                        style: White(10, FontWeight.w600)),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
              left: 50, bottom: 11, child: Image.asset('assets/Main/tree.png')),
          Positioned(
              left: 110,
              bottom: 11,
              child: Image.asset('assets/Main/tree.png')),
          Positioned(
              left: 170,
              bottom: 11,
              child: Image.asset('assets/Main/tree.png')),
          Positioned(
              right: 60, bottom: 11, child: Image.asset('assets/Main/pet.png')),
        ],
      );
    });
  }
}
