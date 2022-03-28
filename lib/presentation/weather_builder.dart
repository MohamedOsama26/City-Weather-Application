import 'package:city_weather/logic/weather/weather_bloc.dart';
import 'package:city_weather/presentation/error_screen.dart';
import 'package:city_weather/presentation/search_screen.dart';
import 'package:city_weather/presentation/weather_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherBuilder extends StatelessWidget {
  final TextEditingController cityController = TextEditingController();
  final double? long;
  final double? lat;

  WeatherBuilder({Key? key, this.long, this.lat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
      // Wait to fetch weather by position display search box
      if (state is WeatherIsNotSearched) {
        // See is location detected or not, if location detected ask weather bloc to get weather by position
        if (long != null || lat != null) {
          BlocProvider.of<WeatherBloc>(context)
              .add(FetchWeatherByPosition(lat!, long!));
          return const SizedBox();
        }

        // if location is not detected display search box
        else {
          return SearchScreen(cityController: cityController,);
        }
      }

      // Displayed while fetching weather data
      else if (state is WeatherIsLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }

      // Send data of result even it was by search or detected location to display
      else if (state is WeatherIsLoaded) {
        return ShowWeather(
          currentWeatherModel: state.getWeather,
          city: cityController.text,
        );
      }

      //Display there is something went wrong while fetching data
      else if (state is WeatherIsNotLoaded) {
        return ErrorScreen(long: long,lat: lat,);
      }


      else {
        return Column(
          children: const [
            Center(
              child: Icon(Icons.error_outline, size: 20),
            )
          ],
        );
      }
    });
  }
}
