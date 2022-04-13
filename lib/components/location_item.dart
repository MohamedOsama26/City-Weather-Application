import 'package:city_weather/logic/theme/theme_bloc.dart';
import 'package:city_weather/logic/weather/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (themeContext, themeState) {
        return BlocBuilder<WeatherBloc, WeatherState>(
          builder: (weatherContext, weatherState) {
            return InkWell(
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/snow.png',
                      height: 60,
                      color: themeState.isDark ? Colors.white : Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Cairo',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            color:
                                themeState.isDark ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text(
                          '22°C',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Cuprum',
                            letterSpacing: 1,
                            color:
                                themeState.isDark ? Colors.white : Colors.black,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          'Snow',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 1,
                            color:
                                themeState.isDark ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    InkWell(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.delete,
                          color:
                              themeState.isDark ? Colors.white : Colors.black,
                        ),
                      ),
                      onTap: () {
                        print('tapped');
                      },
                    ),
                  ],
                ),
              ),
              onTap: () {
                print('g');
              },
            );
          },
        );
      },
    );
  }
}
