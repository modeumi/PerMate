import 'package:flutter/material.dart';

class WeatherModel {
  Widget getWeatherIcon(int condition) {
    if (condition < 400) {
      return Image.asset('assets/Main/weather (5).png');
    } else if (condition < 700) {
      return Image.asset('assets/Main/weather (4).png');
    } else if (condition < 800) {
      return Image.asset('assets/Main/weather (3).png');
    } else if (condition == 800) {
      return Image.asset('assets/Main/weather (1).png');
    } else if (condition <= 804) {
      return Image.asset('assets/Main/weather (2).png');
    }
    return Image.asset('assets/Main/weather (2).png');
  }

  // Widget getAirIcon(int condition) {
  //   if (condition == 1) {
  //     return Image.asset('assets/image/good.png');
  //   } else if (condition == 2) {
  //     return Image.asset('assets/image/fair.png');
  //   } else if (condition == 3) {
  //     return Image.asset('assets/image/moderate.png');
  //   } else if (condition == 4) {
  //     return Image.asset('assets/image/poor.png');
  //   } else if (condition == 5) {
  //     return Image.asset('assets/image/bad.png');
  //   }

  //   return Image.asset('assets/image/bad.png');
  // }

  Widget getAirCondition(int condition) {
    if (condition == 1) {
      return const Text(
        '매우 좋음',
      );
    } else if (condition == 2) {
      return const Text(
        '좋음',
      );
    } else if (condition == 3) {
      return const Text(
        '보통',
      );
    } else if (condition == 4) {
      return const Text(
        '나쁨',
      );
    } else if (condition == 5) {
      return const Text(
        '매우나쁨',
      );
    }

    return const Text(
      '매우나쁨',
    );
  }
}
