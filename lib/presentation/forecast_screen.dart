import 'package:city_weather/components/daily_forecast_item.dart';
import 'package:city_weather/components/hourly_forcast_item.dart';
import 'package:city_weather/components/location_app_bar.dart';
import 'package:flutter/material.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(right: 25, left: 25, top: 25),
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            const LocationAppBar(region: 'ismailia'),
            const SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              child: const Text(
                'Forecast',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                    fontSize: 45),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Hourly Forecast',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text('Daily Forecast',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1,
                  )),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  DailyForecastItem(),
                  DailyForecastItem(),
                  DailyForecastItem(),
                  DailyForecastItem(),
                  DailyForecastItem(),
                  DailyForecastItem(),
                  DailyForecastItem(),
                  DailyForecastItem(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
