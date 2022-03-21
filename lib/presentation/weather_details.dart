
import 'package:city_weather/components/rive_animation.dart';
import 'package:city_weather/data/weather_model.dart';
import 'package:flutter/material.dart';

class ShowWeather extends StatelessWidget {

  final CurrentWeatherModel currentWeatherModel;
  final String city;
  const ShowWeather({Key? key, required this.currentWeatherModel, required this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.only(right: 32, left: 32, top: 10),
      child: Column(
        children: [
          Text('${currentWeatherModel.city}, ${currentWeatherModel.country}'),
          Container(
            child: weatherIcon(
                currentWeatherModel.description,
                currentWeatherModel.sunrise,
                currentWeatherModel.sunset,
              currentWeatherModel.timeZone,
            ),
            width: 100,
            height: 100,
          ),
          Text(DateTime.fromMillisecondsSinceEpoch(
              currentWeatherModel.dataCalculatingTime * 1000)
              .toString()),
          Text(
            city,
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            currentWeatherModel.getTemp.toStringAsFixed(2) + " C",
            style: const TextStyle(color: Colors.white70, fontSize: 50),
          ),
          const Text(
            "Temperature",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: <Widget>[
                  Text(
                    currentWeatherModel.getMinTemp.toStringAsFixed(2) + " C",
                    style: const TextStyle(color: Colors.white70, fontSize: 30),
                  ),
                  const Text(
                    "Min Temperature",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    currentWeatherModel.getMaxTemp.toStringAsFixed(2) + " C",
                    style: const TextStyle(color: Colors.white70, fontSize: 30),
                  ),
                  const Text(
                    "Max Temperature",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }


  }
