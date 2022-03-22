import 'package:city_weather/components/rive_animation.dart';
import 'package:city_weather/data/weather_model.dart';
import 'package:flutter/material.dart';

class ShowWeather extends StatelessWidget {
  final CurrentWeatherModel currentWeatherModel;
  final String city;
  const ShowWeather(
      {Key? key, required this.currentWeatherModel, required this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.95,
        padding: const EdgeInsets.only(right: 16, left: 16),
        // color: Colors.red,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              child: Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    ' ${currentWeatherModel.city}, ${currentWeatherModel.country}',
                    style: const TextStyle(
                        fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ],
              ),
              alignment: Alignment.topLeft,
            ),
            const SizedBox(
              height: 16,
            ),
            Container(
              height: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // color: Colors.green,
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: 200,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.40,
                            height: 150,
                            child: weatherIcon(
                              currentWeatherModel.description,
                              currentWeatherModel.sunrise,
                              currentWeatherModel.sunset,
                              currentWeatherModel.timeZone,
                            ),
                          ),
                          Text(
                            currentWeatherModel.description,
                            style: const TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 20),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: const VerticalDivider(
                      color: Color(0xFFFFFFFF),
                      thickness: 2,
                    ),
                    height: 150,
                  ),
                  Container(
                    // color: Colors.green,
                    width: MediaQuery.of(context).size.width * 0.40,
                    height: 150,
                    padding: const EdgeInsets.only(left: 12),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Feels like ${currentWeatherModel.getFeelsLike.toStringAsFixed(0)}°C',
                            style: const TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 16),
                          ),
                          Text(
                            'Pressure: ${currentWeatherModel.pressure} hPa',
                            style: const TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 14),
                          ),
                          Text(
                            'Humidity: ${currentWeatherModel.humidity} %',
                            style: const TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 14),
                          ),
                          Text(
                            'Wind speed: ${currentWeatherModel.windSpeed} m/s',
                            style: const TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 14),
                          ),
                          Text(
                            'Cloudiness: ${currentWeatherModel.clouds} %',
                            style: const TextStyle(
                                color: Color(0xFFFFFFFF), fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    currentWeatherModel.getTemp.toStringAsFixed(0) + "°",
                    style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    '${currentWeatherModel.getMinTemp.toStringAsFixed(0)}°',
                    style: const TextStyle(color: Colors.white70, fontSize: 35),
                  ),
                  const Text(
                    'Min',
                    style: TextStyle(color: Colors.white70, fontSize: 15),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(
                    '/${currentWeatherModel.getMaxTemp.toStringAsFixed(0)}°',
                    style: const TextStyle(color: Colors.white70, fontSize: 35),
                  ),
                  const Text(
                    'Max',
                    style: TextStyle(color: Colors.white70, fontSize: 15),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
