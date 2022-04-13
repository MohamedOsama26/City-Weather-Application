import 'package:city_weather/logic/address/address_bloc.dart';
import 'package:city_weather/logic/theme/theme_bloc.dart';
import 'package:city_weather/logic/weather/weather_bloc.dart';
import 'package:city_weather/presentation/details_screen.dart';
import 'package:city_weather/presentation/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int pageIndex = 0;
  late PageController pageController;
  late String? position;
  double? lat, lon;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: pageIndex);
    position = BlocProvider.of<AddressBloc>(context).state.position;
    BlocProvider.of<WeatherBloc>(context)
        .add(FetchWeatherByPosition(position: position));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.isDark ? Colors.black : Colors.white,
          body: BlocBuilder<WeatherBloc, WeatherState>(
            builder: (context, state) {
              if (state is WeatherIsNotLoaded) {
                // print(state.getError);
                // print(state);
                return const Text('Error');
              } else if (state is WeatherIsLoaded) {
                return PageView(
                  controller: pageController,
                  scrollDirection: Axis.vertical,
                  children: [
                    HomeScreen(
                      controller: pageController,
                      description: state.getWeather.condition,
                      icon: state.getWeather.icon,
                      lastUpdated: state.getWeather.lastUpdated,
                      temp: state.getWeather.temp,
                      region: state.getWeather.region,
                    ),
                    DetailsScreen(
                      controller: pageController,
                      region: state.getWeather.region,
                      precipitation: state.getWeather.precipitation,
                      visibility: state.getWeather.visibility,
                      windDir: state.getWeather.windDirection,
                      windKph: state.getWeather.windKph,
                      pressure: state.getWeather.pressure,
                      uv: state.getWeather.uv,
                      humidity: state.getWeather.humidity,
                      // humidity: state.getWeather.humidity,
                    ),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        );
      },
    );
  }
}
