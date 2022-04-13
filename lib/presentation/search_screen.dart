import 'package:city_weather/logic/location/location_bloc.dart';
import 'package:city_weather/logic/weather/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  final TextEditingController cityController;

  const SearchScreen({Key? key, required this.cityController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                borderSide:
                    BorderSide(color: Colors.white70, style: BorderStyle.solid),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide:
                    BorderSide(color: Colors.blue, style: BorderStyle.solid),
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
          BlocListener<LocationBloc, LocationState>(
            listener: (context, state) {},
            child: ElevatedButton(
              child: const Text('Search location'),
              onPressed: () {
                BlocProvider.of<LocationBloc>(context).add(FetchLocation());
              },
            ),
          ),
        ],
      ),
    );
  }
}
