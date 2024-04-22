import 'package:flutter/cupertino.dart';
import 'package:petmate/Model/current_air.dart';
import 'package:petmate/Model/current_weather.dart';

class WeatherProvider extends ChangeNotifier {
  CurrentWeather _weatherData = CurrentWeather();
  CurrentAir _airData = CurrentAir();

  CurrentWeather get weatherData => _weatherData;
  CurrentAir get airData => _airData;

  void updateWeatherData(CurrentWeather weatherData, CurrentAir airData) {
    _weatherData = weatherData;
    _airData = airData;
    notifyListeners();
  }
}
