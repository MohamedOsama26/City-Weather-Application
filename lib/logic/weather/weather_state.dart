part of 'weather_bloc.dart';

class WeatherState extends Equatable {
  @override
  List<Object> get props => [];
}

class WeatherIsNotSearched extends WeatherState {}

class WeatherIsLoading extends WeatherState {}

class WeatherIsLoaded extends WeatherState {
  final CurrentWeatherModel _weather;
  WeatherIsLoaded(this._weather);

  CurrentWeatherModel get getWeather => _weather;

  @override
  List<Object> get props => [_weather];
}

class WeatherIsNotLoaded extends WeatherState {}



class NoLocation extends WeatherState {} // this state will be used when the GPS is closed and user did not searched about the place

class FoundLocationLoadingWeather extends WeatherState {} // this state will be used when location is found and searching for weather

class FoundLocationLoadedWeather extends WeatherState {} // this state will be used when the location is found even by GPS or manual search and found the weather to display it

class NoWeather extends WeatherState {}