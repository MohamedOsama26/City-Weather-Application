import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:city_weather/data/weather_model.dart';

class WeatherRepo {
  Future<WeatherModel> getWeather(String city) async{
    final result = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=64f4f86c4b4de03d7464bee22ee4c94a'));
    if(result.statusCode != 200) {
      throw Exception();
    }
      return parsedJson(result.body);


  }

  WeatherModel parsedJson(final response){
    final jsonDecoded = json.decode(response);
    final jsonWeather = jsonDecoded['main'];
    return WeatherModel.fromJson(jsonWeather);
  }
}