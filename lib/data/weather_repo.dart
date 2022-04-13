import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:city_weather/data/weather_model.dart';

class WeatherRepo {
  Future<CurrentWeatherModel> getCurrentWeatherByName(String city) async {
    final result = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=bcc6d1223814476ca73152654222803&q=$city&aqi=yes'));
    if (result.statusCode != 200) {
      throw Exception();
    }
    return parsedJson(result.body);
  }

  Future<CurrentWeatherModel> getCurrentWeatherByPosition(
      {String? position}) async {
    final result = await http.get(Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=bcc6d1223814476ca73152654222803&q=$position&aqi=yes'));
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
