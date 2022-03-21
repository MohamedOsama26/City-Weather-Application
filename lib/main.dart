import 'package:city_weather/data/location_reop.dart';
import 'package:city_weather/data/weather_model.dart';
import 'package:city_weather/data/weather_repo.dart';
import 'package:city_weather/logic/location/location_bloc.dart';
import 'package:city_weather/logic/weather/weather_bloc.dart';
import 'package:city_weather/presentation/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => WeatherBloc(WeatherRepo()),
            ),
            BlocProvider(
              create: (context) => LocationBloc(LocationRepo()),
            )
          ],
          child: const MainScreen(),
        ),
      ),
    );
  }
}





class ShowWeather extends StatelessWidget {
  CurrentWeatherModel currentWeatherModel;
  final String city;
  ShowWeather({Key? key, required this.currentWeatherModel, required this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 32, left: 32, top: 10),
      child: Column(
        children: [
          Text(
            city,
            style: const TextStyle(
                color: Colors.white70,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            currentWeatherModel.getTemp.round().toString() + " C",
            style: const TextStyle(color: Colors.white70, fontSize: 50),
          ),
          const Text(
            "Temperature",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: <Widget>[
                  Text(
                    currentWeatherModel.getMinTemp.round().toString() + " C",
                    style: const TextStyle(color: Colors.white70, fontSize: 30),
                  ),
                  const Text(
                    "Min Temperature",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
              Column(
                children: <Widget>[
                  Text(
                    currentWeatherModel.getMaxTemp.round().toString() + " C",
                    style: const TextStyle(color: Colors.white70, fontSize: 30),
                  ),
                  const Text(
                    "Max Temperature",
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

//token
//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

// Future _checkGps(context) async {
//   if (!(await Geolocator.isLocationServiceEnabled())) {
//     if (Theme.of(context).platform == TargetPlatform.android) {
//       showDialog(
//           context: context,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               title: Text("Can't get gurrent location"),
//               content:const Text('Please make sure you enable GPS and try again'),
//               actions: <Widget>[
//                 FlatButton(child: Text('Ok'),
//                     onPressed: () {
//                       // final AndroidIntent intent = AndroidIntent(
//                       //     action: 'android.settings.LOCATION_SOURCE_SETTINGS');
//                       // intent.launch();
//                       // Navigator.of(context, rootNavigator: true).pop();
//                       // _gpsService();
//                     }
//                     )],
//             );
//           });
//     }
//   }
// }
