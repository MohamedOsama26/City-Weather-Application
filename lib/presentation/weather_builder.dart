import 'package:city_weather/logic/weather/weather_bloc.dart';
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
                SizedBox(
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
        return Column(
          children: [
            const Center(
              child: Icon(
                Icons.error_outline,
                size: 80,
                color: Color(0xFFFFFFFF),
              ),
            ),
            SizedBox(height: 60,),
            const Text(
              'Something went wrong, Please try again!',
              style: TextStyle(
                  fontSize: 20,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
                onPressed: () {
                  if (long != null || lat != null) {
                    BlocProvider.of<WeatherBloc>(context)
                        .add(FetchWeatherByPosition(lat!, long!));
                  }
                },
                child: const Text('Reload',style: TextStyle(fontSize: 20),),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                primary: Color(0xFFFF0000)
              ),
            )
          ],
        );
      } else {
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
