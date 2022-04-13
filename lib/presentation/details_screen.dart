import 'package:city_weather/components/location_app_bar.dart';
import 'package:city_weather/logic/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsScreen extends StatefulWidget {
  DetailsScreen({Key? key,
    required this.controller,
    required this.region,
    required this.precipitation,
    required this.windKph,
    required this.windDir,
    required this.visibility,
    required this.pressure, required this.uv, required this.humidity})
      : super(key: key);

  final String region;
  final double precipitation;
  final double windKph;
  final String windDir;
  final double visibility;
  final double pressure;
  final double uv;
  final double humidity;

  PageController controller;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(right: 25, left: 25, top: 25),
            child: Column(
              children: [
                SizedBox(
                  height: 25,
                ),
                LocationAppBar(region: widget.region),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  // color: Colors.red,
                  child: Text(
                    'Details',
                    style: TextStyle(
                        fontFamily: 'Yanone Kaffeesatz',
                        color: state.isDark ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 2,
                        fontSize: 45),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Precipitation',
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Yanone Kaffeesatz',
                              color: state.isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${widget.precipitation} mm',
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Cuprum',
                              color: state.isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              fontSize: 26),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${widget.windDir} Wind',
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Yanone Kaffeesatz',
                              color: state.isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${widget.windKph} km/h',
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Cuprum',
                              color: state.isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              fontSize: 26),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Humidity',
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Yanone Kaffeesatz',
                              color: state.isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${widget.humidity} %',
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Cuprum',
                              color: state.isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              fontSize: 26),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Visibility',
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Yanone Kaffeesatz',
                              color: state.isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${widget.visibility} km',
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Cuprum',
                              color: state.isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              fontSize: 26),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'UV',
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Yanone Kaffeesatz',
                              color: state.isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          UV(widget.uv),
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Cuprum',
                              color: state.isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                              fontSize: 26),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  width: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Pressure',
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Yanone Kaffeesatz',
                              color: state.isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                              fontSize: 22),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '${widget.pressure} hPa',
                          // textAlign: TextAlign.left,
                          style: TextStyle(
                              fontFamily: 'Cuprum',
                              color: state.isDark ? Colors.white : Colors.black,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 2,
                              fontSize: 26),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        );
      },
    );
  }

  String UV(uv) {
    switch (uv) {
      case 1:
      case 2:
        return 'Low';
      case 3:
      case 4:
      case 5:
        return 'Moderate';
      case 6:
      case 7:
        return 'High';
      case 8:
      case 9:
      case 10:
        return 'Very High';
      default:
        return 'uv index is $uv';
    }
  }

}