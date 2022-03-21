import 'package:city_weather/data/location_reop.dart';
import 'package:city_weather/data/weather_repo.dart';
import 'package:equatable/equatable.dart';
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
        print('number 1');
        final weather = await weatherRepo.getCurrentWeatherByName(event._city);
        emit(WeatherIsLoaded(weather));
      } catch (_) {
        print('number 2');
        print('In Bloc file:$_');
        emit(WeatherIsNotLoaded());
      }
    });

    on<ResetWeather>((event, emit) {
      emit(WeatherIsNotSearched());
    });

    on<FetchWeatherByPosition>((event, emit) async {
      emit(WeatherIsLoading());
      try {
        print('number 3 ====>  ${event._lat} , ${event._long}');
        final weather = await weatherRepo.getCurrentWeatherByPosition(
            long: event._long, lat: event._lat);
        print(weather);
        emit(WeatherIsLoaded(weather));
      } catch (_) {
        print('number 4');
        print('In Bloc file:$_');
        emit(WeatherIsNotLoaded());
      }
    });
  }
  // Stream<WeatherState> mapEventToState(WeatherEvent event) async*{
  //   if(event is FetchWeather){
  //     yield WeatherIsLoading();
  //     try{
  //       WeatherModel weather = await weatherRepo.getWeather(event._city);
  //       yield WeatherIsLoaded(weather);
  //     }catch(_){
  //       print(_);
  //       yield WeatherIsNotLoaded();
  //     }
  //   }
  //   else if (event is ResetWeather){
  //     yield WeatherIsNotSearched();
  //   }
  // }

}
