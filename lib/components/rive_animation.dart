import 'package:rive/rive.dart';

RiveAnimation weatherIcon(String description,int sunrise,int sunset,int timeZone) {
  bool morning;

  DateTime sunriseTime = DateTime.fromMillisecondsSinceEpoch(sunrise * 1000);
  DateTime sunsetTime = DateTime.fromMillisecondsSinceEpoch(sunset * 1000);
  DateTime timeZoneTime = DateTime.fromMillisecondsSinceEpoch(timeZone * 1000);


  if (DateTime.now().isAfter(sunriseTime) &&
      DateTime.now().isBefore(sunsetTime)) {
    morning = true;
  }
  else {
    morning = false;
  }

  switch (description) {
    case 'clear sky':
      if (morning) {
        return const RiveAnimation.asset('assets/clearsky_m.riv');
      }
      else {
        return const RiveAnimation.asset('assets/clearsky_n.riv');
      }

    case 'few clouds':
      if (morning) {
        return const RiveAnimation.asset('assets/fewclouds_m.riv');
      }
      else {
        return const RiveAnimation.asset('assets/fewclouds_n.riv');
      }

    case 'scattered clouds':
      return const RiveAnimation.asset('assets/scatterdclouds.riv');

    case 'broken clouds':
      return const RiveAnimation.asset('assets/brokenclouds.riv');

    case 'shower rain':
      return const RiveAnimation.asset('assets/showerrain.riv');

    case 'rain':
      if (morning) {
        return const RiveAnimation.asset('assets/rain_m.riv');
      }
      else {
        return const RiveAnimation.asset('assets/rain_n.riv');
      }

    case 'thunderstorm':
      return const RiveAnimation.asset('assets/thunderstorm.riv');

    case 'snow':
      return const RiveAnimation.asset('assets/snow.riv');

    case 'mist':
      return const RiveAnimation.asset('assets/mist.riv');

    default:
      return const RiveAnimation.asset('assets/WorldSpin.flr');
  }
}