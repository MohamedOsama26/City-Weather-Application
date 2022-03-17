import 'package:city_weather/data/weather_repo.dart';
import 'package:equatable/equatable.dart';
import '../../data/weather_model.dart';
import 'package:bloc/bloc.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherRepo weatherRepo;
  WeatherBloc(this.weatherRepo) : super(WeatherIsNotSearched()) {

    on<FetchWeather>( (event, emit) async{
      emit(WeatherIsLoading());
      try{
      final weather = await weatherRepo.getWeather(event._city);
      emit(WeatherIsLoaded(weather));
      }catch(_){
        print('In Bloc file:$_');
        emit(WeatherIsNotLoaded());
      }
    });

    on<ResetWeather>((event,emit){
      emit(WeatherIsNotSearched());
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
