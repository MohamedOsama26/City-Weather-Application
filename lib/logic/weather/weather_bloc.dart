import 'package:city_weather/data/location_reop.dart';
import 'package:city_weather/data/weather_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import '../../data/weather_model.dart';
import 'package:bloc/bloc.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {

  WeatherRepo weatherRepo;

  WeatherBloc(this.weatherRepo) : super(WeatherIsNotSearched()) {
    on<FetchWeather>((event, emit) async {
      emit(WeatherIsLoading());
      try {
        final weather = await weatherRepo.getCurrentWeatherByName(event._city);
        emit(WeatherIsLoaded(weather));
        print(weather);
        // print(event._city);
      } catch (_) {
        emit(WeatherIsNotLoaded(_.toString()));
      }
    });

    on<ResetWeather>((event, emit) {
      emit(WeatherIsNotSearched());
    });

    on<FetchWeatherByPosition>((event, emit) async {
      emit(WeatherIsLoading());
      try {
        final weather = await weatherRepo.getCurrentWeatherByPosition(
            long: event.long, lat: event.lat, position: event.position);
        emit(WeatherIsLoaded(weather));
      } catch (_) {
        emit(WeatherIsNotLoaded(_.toString()));
      }
    });
  }

  // Map<String, dynamic> toJson(WeatherState state){
  //   if(state is WeatherIsLoaded){
  //     return state._weather.toJson;
  //   }
  //   else{
  //     return null;
  //   }
  // }
  //
  // WeatherState fromJson(Map<String, dynamic> json){
  //   try{
  //     final weather = Weather.
  //   }catch(e){}
  // }

}
