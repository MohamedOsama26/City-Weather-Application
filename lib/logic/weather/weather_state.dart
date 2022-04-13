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

class WeatherIsNotLoaded extends WeatherState {
  final String _error;

  WeatherIsNotLoaded(this._error);

  String get getError => _error;

  @override
  List<Object> get props => [_error];
}
