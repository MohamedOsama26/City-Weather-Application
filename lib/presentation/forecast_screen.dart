import 'package:city_weather/components/daily_forecast_item.dart';
import 'package:city_weather/components/hourly_forcast_item.dart';
import 'package:city_weather/components/location_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ForecastScreen extends StatelessWidget {
  const ForecastScreen({Key? key, }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.only(right: 25, left: 25, top: 25),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            LocationAppBar(region: 'ismailia'),
            SizedBox(
              height: 40,
            ),
            Container(
              width: double.infinity,
              // color: Colors.red,
              child: Text(
                'Forecast',
                style: TextStyle(
                    fontFamily: 'Yanone Kaffeesatz',
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2,
                    fontSize: 45),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Hourly Forecast',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Yanone Kaffeesatz',
                    letterSpacing: 1,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              // color: Colors.blue,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                  HourlyForecastItem(),
                ],
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Daily Forecast',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Yanone Kaffeesatz',
                    letterSpacing: 1,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
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
