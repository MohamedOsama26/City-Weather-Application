import 'package:city_weather/components/location_item.dart';
import 'package:city_weather/logic/theme/theme_bloc.dart';
import 'package:city_weather/logic/weather/weather_bloc.dart';
import 'package:city_weather/presentation/add_city_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key? key}) : super(key: key);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WeatherBloc>(context).add(FetchWeatherByPosition());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: state.isDark ? Colors.black : Colors.white,
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: state.isDark ? Colors.white : Colors.black,
                          ),
                          onTap: () => Navigator.pop(context),
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        Container(
                          child: Text(
                            'Select City',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w500,
                                color:
                                    state.isDark ? Colors.white : Colors.black,
                                letterSpacing: 1),
                          ),
                        ),
                        const Spacer(),
                        InkWell(
                          child: Container(
                            child: Icon(
                              Icons.add,
                              color: state.isDark ? Colors.white : Colors.black,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const AddCityScreen(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 8,
                      ),
                      margin: const EdgeInsets.only(top: 22),
                      child: Row(
                        children: [
                          Icon(
                            Icons.gps_fixed,
                            color: state.isDark ? Colors.white : Colors.black,
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'Get current location by GPS',
                            style: TextStyle(
                              color: state.isDark ? Colors.white : Colors.black,
                              letterSpacing: 2,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // onTap: () {
                    //   print('GPS');
                    // },
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height - 100,
                    child: BlocBuilder<WeatherBloc, WeatherState>(
                      builder: (weatherContext, weatherState) {
                        return ListView(
                          children: const [
                            LocationItem(),
                            LocationItem(),
                            LocationItem(),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
