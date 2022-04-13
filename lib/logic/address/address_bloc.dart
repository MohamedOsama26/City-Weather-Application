import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:city_weather/data/address_model.dart';
import 'package:city_weather/data/location_reop.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:meta/meta.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends HydratedBloc<AddressEvent, AddressState> {

  LocationRepo repo = LocationRepo();

  AddressBloc() : super(const UserAddressState()) {
    on<GetAddress>((event, emit) async {
      try{
        final position = await repo.getGeoLocationPosition();
        print('Location here is : $position');
        emit(UserAddressState(position: '${position.latitude.toStringAsFixed(3)},${position.longitude.toStringAsFixed(3)}'));
      }catch(e){
        print(e);
      }
    });

    on<ChangeAddress>((event, emit) => {
      emit(UserAddressState())
    });
  }

  @override
  AddressState? fromJson(Map<String, dynamic> json) {
    return UserAddressState(position: json['value'] as String);
  }

  @override
  Map<String, dynamic>? toJson(AddressState state) {
    return {'value':state.position};
  }
}
