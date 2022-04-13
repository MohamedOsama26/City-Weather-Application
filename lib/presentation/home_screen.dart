import 'package:city_weather/components/location_app_bar.dart';
import 'package:city_weather/logic/theme/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen(
      {Key? key,
      required this.controller,
      required this.icon,
      required this.description,
      required this.lastUpdated,
      required this.region,
      required this.temp})
      : super(key: key);

  final PageController controller;
  final String region;
  final DateTime lastUpdated;
  final double temp;
  final String icon;
  final String description;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Container(
          margin: const EdgeInsets.all(25),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              LocationAppBar(region: widget.region),
              const SizedBox(
                height: 30,
              ),
              Text(
                'in sync',
                style: TextStyle(
                  color: state.isDark ? Colors.white : Colors.black,
                  letterSpacing: 1,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                DateFormat.yMMMd().format(widget.lastUpdated),
                style: TextStyle(
                  fontFamily: 'Cuprum',
                  color: state.isDark ? Colors.white : Colors.black,
                  letterSpacing: 2,
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    width: 30,
                  ),
                  Text(
                    widget.temp.toString(),
                    style: TextStyle(
                      fontFamily: 'cuprum',
                      color: state.isDark ? Colors.white : Colors.black,
                      letterSpacing: 2,
                      fontSize: 100,
                    ),
                  ),
                  Text(
                    '°C',
                    style: TextStyle(
                      color: state.isDark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      fontSize: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Image.network(
                widget.icon,
                fit: BoxFit.fitWidth,
                height: 150,
              ),
              Text(
                widget.description,
                style: TextStyle(
                  color: state.isDark ? Colors.white : Colors.black,
                  letterSpacing: 2,
                  fontSize: 30,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Spacer(),
              InkWell(
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        'Details',
                        style: TextStyle(
                          color: state.isDark ? Colors.white : Colors.black,
                          letterSpacing: 1,
                          fontSize: 15,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: state.isDark ? Colors.white : Colors.black,
                      )
                    ],
                  ),
                ),
                onTap: () {
                  setState(() {
                    widget.controller.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.easeInOutSine,
                    );
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
