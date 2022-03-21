part of 'weather_bloc.dart';

class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchWeather extends WeatherEvent{
  final String _city;
  FetchWeather(this._city);
  @override
  List<Object> get props => [_city];
}

class FetchWeatherByPosition extends WeatherEvent{
  final double _long;
  final double _lat;
  FetchWeatherByPosition(this._lat,this._long);

  @override
  List<Object> get props => [_long,_lat];
}

class ResetWeather extends WeatherEvent{
  @override
  List<Object> get props => [];
}
