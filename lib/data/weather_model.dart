class CurrentWeatherModel {
  final double temp;
  final int humidity;
  final double tempMax;
  final double tempMin;
  final int pressure;
  final String description;
  final String city;
  final String country;
  final double feelsLike;
  final double windSpeed;
  final int windDegree;
  final int clouds;
  final int dataCalculatingTime;
  final int sunrise;
  final int sunset;
  final int timeZone;

  double get getTemp => temp.toDouble() - 273.15;
  double get getMaxTemp => tempMax.toDouble() - 273.15;
  double get getMinTemp => tempMin.toDouble() - 273.15;

  CurrentWeatherModel({
      required this.description,
      required this.city,
      required this.country,
      required this.feelsLike,
      required this.windSpeed,
      required this.windDegree,
      required this.clouds,
      required this.dataCalculatingTime,
      required this.sunrise,
      required this.sunset,
      required this.timeZone,
      required this.humidity,
      required this.pressure,
      required this.temp,
      required this.tempMax,
      required this.tempMin});

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    print('____________Model Open______________');
        print(  json['weather'][0]['description']);
        print( json['main']['temp'] as double);
        print(  json['main']['feels_like'] as double);
        print(  json['main']['temp_min']);
        print(  json['main']['temp_max'] as double);
        print(  json['main']['pressure'] as int);
        print(  json['main']['humidity'] as int);
        print(  json['wind']['speed'] as double);
        print(  json['wind']['deg'] as int);
        print(  json['clouds']['all'] as int);
        print(  json['dt'] as int);
        print(  json['sys']['country']);
        print(  json['sys']['sunrise'] as int);
        print(  json['sys']['sunset'] as int);
        print(  json['timezone'] as int);
        print(  json['name']);
    print('____________Model Close______________');
        return CurrentWeatherModel(
      description: json['weather'][0]['description'],
      temp: json['main']['temp'] as double,
      feelsLike: json['main']['feels_like'] as double,
      tempMin: json['main']['temp_min'] as double,
      tempMax: json['main']['temp_max'] as double,
      pressure: json['main']['pressure'] as int,
      humidity: json['main']['humidity'] as int,
      windSpeed: json['wind']['speed'] as double,
      windDegree: json['wind']['deg'] as int,
      clouds: json['clouds']['all'] as int,
      dataCalculatingTime: json['dt'] as int,
      country: json['sys']['country'],
      sunrise: json['sys']['sunrise'] as int,
      sunset: json['sys']['sunset'] as int,
      timeZone: json['timezone'] as int,
      city: json['name'],

    );
  }
}
