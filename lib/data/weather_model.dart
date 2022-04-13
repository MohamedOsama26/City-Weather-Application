class CurrentWeatherModel {
  final String region;
  final DateTime lastUpdated;
  final double temp;
  final bool isDay;
  final String condition;
  final double windKph;
  final String windDirection;
  final double pressure;
  final double precipitation;
  final double visibility;
  final double uv;
  final String icon;
  final double humidity;

  CurrentWeatherModel({
    required this.region,
    required this.lastUpdated,
    required this.temp,
    required this.isDay,
    required this.condition,
    required this.windKph,
    required this.windDirection,
    required this.precipitation,
    required this.visibility,
    required this.uv,
    required this.pressure,
    required this.icon,
    required this.humidity
  });

  factory CurrentWeatherModel.fromJson(Map<String, dynamic> json) {
    return CurrentWeatherModel(
        condition: json['current']['condition']['text'],
        isDay: json['current']['is_day'] == 1 ? true : false,
        lastUpdated: DateTime.parse(json['current']['last_updated']),
        pressure: json['current']['pressure_mb'],
        precipitation: json['current']['precip_mm'],
        region: json['location']['name'],
        temp: json['current']['temp_c'],
        visibility: json['current']['vis_km'],
        windDirection: json['current']['wind_dir'],
        windKph: json['current']['wind_kph'],
        uv: json['current']['uv'],
        icon: 'http:${json['current']['condition']['icon']}',
        humidity: double.parse(json['current']['humidity'].toString())
        );
  }
}
