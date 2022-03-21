import 'package:city_weather/const.dart';
import 'package:city_weather/data/location_reop.dart';
import 'package:city_weather/logic/location/location_bloc.dart';
import 'package:city_weather/presentation/weather_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: const [
                      Icon(Icons.location_on_outlined,
                          color: Color(0xffffffff), size: 20),
                      Text(
                        'Ismailia, Egypt',
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFFFFFFF),
                            letterSpacing: 1),
                      )
                    ],
                  ),
                ),
                const Icon(Icons.search_rounded,
                    color: Color(0xffffffff), size: 25)
              ],
            ),
          ),
          const Center(
            child: SizedBox(
              child: RiveAnimation.asset(
                'assets/mist.riv',
                animations: ['Animation 1'],
              ),
              height: 260,
              width: 260,
            ),
          ),

          BlocBuilder<LocationBloc, LocationState>(
            builder: (context, state) {
              if (state is LocationInitial) {
                BlocProvider.of<LocationBloc>(context).add(FetchLocation());
                // print("===============> Found Here Point 1 <===============");
                return const Text('initial');
              } else if (state is LocationIsLoaded) {
                return Column(
                  children: [
                    WeatherBuilder(
                      long: state.getLocation.longitude,
                      lat: state.getLocation.latitude,
                    ),
                    Center(child: Text(state.getLocation.floor.toString())),
                    Center(child: Text(state.getLocation.toString())),
                    Center(child: Text(state.getAddress.locality.toString())),
                  ],
                );
              } else {
                // BlocProvider.of<LocationBloc>(context).add(FetchLocation());
                return Column(
                  children: [
                    WeatherBuilder(),
                    ElevatedButton(
                      child: const Text('Search location'),
                      onPressed: () {
                        BlocProvider.of<LocationBloc>(context)
                            .add(FetchLocation());
                        print(
                            "===============> Found Here Point 2 <===============");
                      },
                    ),
                  ],
                );
              }
            },
          ),
        ],
      ),
    );
  }
}