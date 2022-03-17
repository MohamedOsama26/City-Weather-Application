import 'package:city_weather/const.dart';
import 'package:city_weather/data/location_reop.dart';
import 'package:city_weather/data/weather_model.dart';
import 'package:city_weather/data/weather_repo.dart';
import 'package:city_weather/logic/location/location_bloc.dart';
import 'package:city_weather/logic/weather/weather_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rive/rive.dart';

void main() {
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
          child: SearchPage(),
        ),

      ),
    );
  }
}

class SearchPage extends StatelessWidget {
  TextEditingController cityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: sunnyBackground()
      ),
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
                      Icon(Icons.location_on_outlined,color: Color(0xffffffff),size: 20),
                      Text('Ismailia, Egypt',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Color(0xFFFFFFFF),letterSpacing: 1),)
                    ],
                  ),
                ),
                const Icon(Icons.search_rounded,color: Color(0xffffffff),size: 25)
              ],
            ),
          ),
          const Center(
            child: SizedBox(
              child: RiveAnimation.asset('assets/mist.riv',
                animations: ['Animation 1'],
              ),


              height: 260,
              width: 260,
            ),
          ),

          BlocBuilder<LocationBloc,LocationState>(builder: (context, state) {
            if(state is LocationInitial){
              BlocProvider.of<LocationBloc>(context).add(FetchLocation());
            }
            else if (state is LocationIsLoaded ){
              print(state.getLocation);
              return Center(child: Text(state.getLocation.toString()));
            }
             {
              // print(repo.getLocation());
              return const Text(
                'Error',
                style: TextStyle(color: Colors.white),
              );
            }
          }
    ),


          BlocBuilder<WeatherBloc, WeatherState>(builder: (context, state) {
            if (state is WeatherIsNotSearched) {
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
                          borderSide: BorderSide(
                              color: Colors.white70, style: BorderStyle.solid),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide(
                              color: Colors.blue, style: BorderStyle.solid),
                        ),
                        hintText: "City Name",
                        hintStyle: TextStyle(color: Colors.white70),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
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
                  ],
                ),
              );
            } else if (state is WeatherIsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is WeatherIsLoaded) {
              return ShowWeather(
                weatherModel: state.getWeather,
                city: cityController.text,
              );
            } else {
              print(state);
              return const Text(
                'Error',
                style: TextStyle(color: Colors.white),
              );
            }
          }),
        ],
      ),
    );
  }
}

class ShowWeather extends StatelessWidget {
  WeatherModel weatherModel;
  final String city;
  ShowWeather({Key? key, required this.weatherModel, required this.city})
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
            weatherModel.getTemp.round().toString() + " C",
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
                    weatherModel.getMinTemp.round().toString() + " C",
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
                    weatherModel.getMaxTemp.round().toString() + " C",
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