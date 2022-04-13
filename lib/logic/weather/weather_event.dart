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
  final double? long;
  final double? lat;
  final String? position;
  FetchWeatherByPosition({this.lat, this.long, this.position});

  @override
  List<Object> get props => [];
}

class ResetWeather extends WeatherEvent{
  @override
  List<Object> get props => [];
}
