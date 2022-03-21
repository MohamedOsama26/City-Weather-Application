import 'package:city_weather/components/rive_animation.dart';
import 'package:city_weather/data/location_reop.dart';
import 'package:city_weather/data/weather_model.dart';
import 'package:city_weather/data/weather_repo.dart';
import 'package:city_weather/logic/location/location_bloc.dart';
import 'package:city_weather/logic/weather/weather_bloc.dart';
import 'package:city_weather/presentation/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => WeatherBloc(WeatherRepo()),
            ),
            BlocProvider(
              create: (context) => LocationBloc(LocationRepo()),
            )
          ],
          child: const MainScreen(),
        ),
      ),
    );
  }
}
