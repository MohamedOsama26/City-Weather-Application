import 'package:city_weather/logic/weather/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorScreen extends StatelessWidget{

  final double? lat;
  final double? long;

  const ErrorScreen({Key? key, this.lat, this.long}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          child: const Text('Reload', style: TextStyle(fontSize: 20),),
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              primary: Color(0xFFFF0000)
          ),
        )
      ],
    );
  }

}