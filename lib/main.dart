import 'dart:io';

// import 'package:city_weather/data/location_reop.dart';
import 'package:city_weather/components/const.dart';
import 'package:city_weather/data/location_reop.dart';
import 'package:city_weather/data/weather_repo.dart';
import 'package:city_weather/logic/address/address_bloc.dart';
import 'package:city_weather/logic/location/location_bloc.dart';
import 'package:city_weather/logic/theme/theme_bloc.dart';
import 'package:city_weather/logic/weather/weather_bloc.dart';
import 'package:city_weather/presentation/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:city_weather/presentation/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  Directory appDir = await getApplicationDocumentsDirectory();
  final storage = await HydratedStorage.build(storageDirectory: appDir);
  HydratedBlocOverrides.runZoned(() => runApp(const WeatherApp()),
      storage: storage);
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => WeatherBloc(WeatherRepo()),
        ),
        BlocProvider(
          create: (context) => LocationBloc(LocationRepo()),
        ),
        BlocProvider(
            create: (context) => AddressBloc()
        ),
        BlocProvider(create: (context) => ThemeBloc()),
      ],

      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddressBloc, AddressState>(
      builder: (context, state) {
        print('Address State: $state');
        return MaterialApp(
          theme: ThemeData(
              primarySwatch: Colors.grey,
              visualDensity: VisualDensity.adaptivePlatformDensity,
              fontFamily: 'Yanone Kaffeesatz'
          ),
          debugShowCheckedModeBanner: false,
          // debugShowMaterialGrid: true,
          home: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (context, state) {
              return const SpalshView(duration: 4);
            },
          ),
        );
      },
    );
  }
}
