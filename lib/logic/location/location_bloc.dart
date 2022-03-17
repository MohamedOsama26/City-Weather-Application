import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:city_weather/data/location_reop.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';


part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationRepo locationRepo;
  LocationBloc(this.locationRepo) : super(LocationInitial()) {

    on<FetchLocation>((event, emit) async{
      emit(LocationInitial());
      try{
        final position = await locationRepo.getLocation();
        emit(LocationIsLoaded(position));
      }catch(_){
        print('In Location BLoC File: $_');
        // emit();
      }
    });
  }
}
