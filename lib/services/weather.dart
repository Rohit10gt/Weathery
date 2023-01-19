import 'package:weathery/services/networking.dart';
import 'package:weathery/services/location.dart';
import 'package:flutter/material.dart';

const String apikey = 'b17c6911f72759a1d8776eb16306762b';
const String openweathermap = 'https://api.openweathermap.org/data/2.5/weather';
class WeatherModel {

  Future<dynamic> getCityweather(String cityname)async{
    Networkhelper networkhelper = Networkhelper('$openweathermap?q=$cityname&appid=$apikey');
    var weatherData =await networkhelper.getData();
    return weatherData;
  }

  Future<dynamic> getlocationweather()async{
    Location location = Location();
    await location.getlocation();

    Networkhelper networkhelper = Networkhelper('$openweathermap?lat=${location.latitude}&lon=${location.lonitude}&appid=$apikey');
    var weatherData =await networkhelper.getData();
    return weatherData;
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀';
    } else if (condition <= 804) {
      return '☁';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp- 273.15 > 25) {
      return 'It\'s 🍦 time.';
    } else if (temp- 273.15 > 20) {
      return 'Time for shorts and 👕';
    } else if (temp- 273.15 > 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case.';
    }
  }
}
