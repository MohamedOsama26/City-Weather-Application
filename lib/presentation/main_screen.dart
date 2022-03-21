// import 'package:city_weather/logic/location/location_bloc.dart';
// import 'package:city_weather/logic/weather/weather_bloc.dart';
//
// // import 'package:city_weather/logic/weather/weather_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// class Details extends StatelessWidget {
//   const Details({Key? key,required this.longitude,required this.latitude}) : super(key: key);
//
//   final String latitude, longitude;
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<LocationBloc, LocationState>(
//       builder: (context, state) {
//         if (state is LocationInitial) {
//           BlocProvider.of<LocationBloc>(context).add(FetchLocation());
//           return const CircularProgressIndicator();
//         }
//         else if (state is LocationIsLoaded) {
//           print(state.getLocation.runtimeType);
//           print(state.getLocation.toString());
//           print(state.getAddress.country);
//           // BlocProvider.of<LocationBloc>(context).add(get)
//           return Column(
//             children: [
//               Center(child: Text(state.getLocation.floor.toString())),
//               Center(child: Text(state.getLocation.toString())),
//               Center(child: Text(state.getLocation.toString())),
//             ],
//           );
//         }
//         return ElevatedButton(child: Text('Search location'), onPressed: () {
//           BlocProvider.of<LocationBloc>(context).add(FetchLocation());
//           print("===============> Found Here Point 2 <===============");
//         },
//         );
//       },
//     );
//   }
//
// }
//
//
// class WeatherDetails extends StatelessWidget {
//   final Widget details;
//
//   const WeatherDetails({Key? key,required this.details}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<WeatherBloc, WeatherState>(
//       builder: (context, state) {
//         // if(state is WeatherIsNotSearched){
//           return Column(
//             children: [
//               Center(child: Text('Weather is not searched'),),
//               details.latitude
//             ],
//           );
//         // }
//         // else if()
//       },
//     );
//   }
//
// }