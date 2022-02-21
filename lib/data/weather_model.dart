class WeatherModel {
  final double temp;
  final int humidity;
  final double tempMax;
  final double tempMin;
  final int pressure;

  double get getTemp => temp-272.5;
  double get getMaxTemp => tempMax-272.5;
  double get getMinTemp => tempMin-272.5;

  WeatherModel({
    required this.humidity,
    required this.pressure,
    required this.temp,
    required this.tempMax,
    required this.tempMin
});

  factory WeatherModel.fromJson(Map<String,dynamic> json){
    return WeatherModel(
        humidity: json['humidity'],
        pressure: json['pressure'],
        temp: json['temp'] as double,
        tempMax: json['temp_max'] as double,
        tempMin: json['temp_min'] as double,
    );
  }
}