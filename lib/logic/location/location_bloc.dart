import 'package:bloc/bloc.dart';
import 'package:city_weather/data/location_reop.dart';
import 'package:equatable/equatable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationRepo locationRepo;
  LocationBloc(this.locationRepo) : super(LocationInitial()) {
    on<FetchLocation>((event, emit) async {
      emit(LocationIsDisabled());
      try {
        final position = await locationRepo.getGeoLocationPosition();
        final details = await locationRepo.getAddressFromLatLong(position);
        emit(LocationIsLoaded(position, details));
      } catch (_) {
        emit(LocationIsDisabled());
        print('In Location BLoC File: $_');
      }
    });
  }
}
