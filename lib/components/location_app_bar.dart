import 'package:city_weather/logic/theme/theme_bloc.dart';
import 'package:city_weather/presentation/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationAppBar extends StatelessWidget {
  const LocationAppBar({Key? key, required this.region}) : super(key: key);
  final String region;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        region,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: state.isDark ? Colors.white : Colors.black,
                          fontSize: 35,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                      Text(
                        'Current Location',
                        style: TextStyle(
                          color: state.isDark ? Colors.white : Colors.black,
                          letterSpacing: 2,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Row(
                  children: [
                    // InkWell(
                    //   child: Icon(
                    //     Icons.map_outlined,
                    //     size: 30,
                    //     color: state.isDark ? Colors.white : Colors.black,
                    //   ),
                    //   onTap: () {
                    //     Navigator.push(context, MaterialPageRoute(builder: (
                    //         context) => const LocationScreen()));
                    //   },
                    //   splashColor: Colors.transparent,
                    //   hoverColor: Colors.transparent,
                    // ),
                    const SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      child: Icon(
                        Icons.settings_outlined,
                        size: 30,
                        color: state.isDark ? Colors.white : Colors.black,
                      ),
                      splashColor: Colors.transparent,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
