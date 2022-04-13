import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:city_weather/data/weather_model.dart';

class WeatherRepo {
  Future<CurrentWeatherModel> getCurrentWeatherByName(String city) async {
    final result = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=$city&appid=64f4f86c4b4de03d7464bee22ee4c94a'));
    if (result.statusCode != 200) {
      throw Exception();
    }
    return parsedJson(result.body);
  }

  Future<CurrentWeatherModel> getCurrentWeatherByPosition(
      {double? long, double? lat, String? position}) async {
    final result = await http.get(Uri.parse('http://api.weatherapi.com/v1/current.json?key=bcc6d1223814476ca73152654222803&q=$position&aqi=yes'));
    if (result.statusCode != 200) {
      throw Exception();
    }
    return parsedJson(result.body);
  }

  CurrentWeatherModel parsedJson(final response) {
    final jsonDecoded = json.decode(response);
    return CurrentWeatherModel.fromJson(jsonDecoded);
  }
}
