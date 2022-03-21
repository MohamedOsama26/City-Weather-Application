import 'package:city_weather/logic/weather/weather_bloc.dart';
import 'package:city_weather/main.dart';
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
      if (state is WeatherIsNotSearched) {
        if (long != null || lat != null) {
          BlocProvider.of<WeatherBloc>(context)
              .add(FetchWeatherByPosition(lat!, long!));
          print('I am here');
          return Text('data');
        } else {
          return Container(
            padding: const EdgeInsets.only(left: 32, right: 32),
            child: Column(
              children: [
                const Text(
                  'Search Weather',
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70),
                ),
                const Text(
                  "Instanly",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w500,
                      color: Colors.white70),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: cityController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white70,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: Colors.white70, style: BorderStyle.solid),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      borderSide: BorderSide(
                          color: Colors.blue, style: BorderStyle.solid),
                    ),
                    hintText: "City Name",
                    hintStyle: TextStyle(color: Colors.white70),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: TextButton(
                    onPressed: () {
                      BlocProvider.of<WeatherBloc>(context)
                          .add(FetchWeather(cityController.text));
                    },
                    child: const Text(
                      'Search',
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      } else if (state is WeatherIsLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is WeatherIsLoaded) {
        return ShowWeather(
          currentWeatherModel: state.getWeather,
          city: cityController.text,
        );
      } else {
        print(state);
        return const Text(
          'Error',
          style: TextStyle(color: Colors.white),
        );
      }
    });
  }
}
