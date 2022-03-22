class CurrentWeatherModel {
  final num temp;
  final num humidity;
  final num tempMax;
  final num tempMin;
  final num pressure;
  final String description;
  final String city;
  final String country;
  final num feelsLike;
  final num windSpeed;
  final num windDegree;
  final num clouds;
  final num dataCalculatingTime;
  final num sunrise;
  final num sunset;
  final num timeZone;

  double get getTemp => temp.toDouble() - 273.15;
  double get getMaxTemp => tempMax.toDouble() - 273.15;
  double get getMinTemp => tempMin.toDouble() - 273.15;
  double get getFeelsLike => feelsLike.toDouble() - 273.15;
  double get getPressure => pressure.toDouble();
  double get getHumidity => humidity.toDouble();
  double get getSpeed => windSpeed.toDouble();

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
    // print('____________Model Open______________');
    //     print(  'description ${json['weather'][0]['description']}');
    //     print(  'temp ${json['main']['temp']}');
    //     print(  'feels_like ${json['main']['feels_like']}');
    //     print(  'temp_min ${json['main']['temp_min']}');
    //     print(  'temp_max ${json['main']['temp_max']}');
    //     print(  'pressure ${json['main']['pressure']}');
    //     print(  'humidity ${json['main']['humidity']}');
    //     print(  'wind speed${json['wind']['speed']}');
    //     print(  'wind deg ${json['wind']['deg']}');
    //     print(  'clouds ${json['clouds']['all']}');
    //     print(  'dt ${json['dt']}');
    //     print(  'country ${json['sys']['country']}');
    //     print(  'sunrise ${json['sys']['sunrise']}');
    //     print(  'sunset ${json['sys']['sunset']}');
    //     print(  'timezone ${json['timezone']}');
    //     print(  'name ${json['name']}');
    // print('____________Model Close______________');
        return CurrentWeatherModel(
      description: json['weather'][0]['description'],
      temp: (json['main']['temp']) as num,
      feelsLike: json['main']['feels_like'] as num,
      tempMin: json['main']['temp_min'] as num,
      tempMax: json['main']['temp_max'] as num,
      pressure: json['main']['pressure'] as num,
      humidity: json['main']['humidity'] as num,
      windSpeed: json['wind']['speed'] as num,
      windDegree: json['wind']['deg'] as num,
      clouds: json['clouds']['all'] as num,
      dataCalculatingTime: json['dt'] as num,
      country: json['sys']['country'],
      sunrise: json['sys']['sunrise'] as num,
      sunset: json['sys']['sunset'] as num,
      timeZone: json['timezone'] as num,
      city: json['name'],

    );
  }
}
