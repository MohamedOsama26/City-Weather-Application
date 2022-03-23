import 'package:city_weather/components/const.dart';
import 'package:city_weather/data/location_reop.dart';
import 'package:city_weather/logic/location/location_bloc.dart';
import 'package:city_weather/presentation/weather_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  LocationRepo repo = LocationRepo();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: sunnyBackground()),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<LocationBloc, LocationState>(
            builder: (context, state) {

              // Loading to find Location
              if (state is LocationInitial) {
                BlocProvider.of<LocationBloc>(context).add(FetchLocation());
                return const Text('Find Location');
              }

              // display Weather Builder Widget depends on location which attached
              else if (state is LocationIsLoaded) {
                return Column(
                  children: [
                    WeatherBuilder(
                      long: state.getLocation.longitude,
                      lat: state.getLocation.latitude,
                    ),
                  ],
                );
              }

              // display Weather Builder Widget without sending location, and display button asking to open GPS
              else if (state is LocationIsDisabled) {
                return Column(
                  children: [
                    WeatherBuilder(),
                  ],
                );
              }

              // Otherwise, location is loading
              else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
