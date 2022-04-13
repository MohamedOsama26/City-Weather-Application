import 'package:city_weather/data/location_reop.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'address_event.dart';
part 'address_state.dart';

class AddressBloc extends HydratedBloc<AddressEvent, AddressState> {
  LocationRepo repo = LocationRepo();

  AddressBloc() : super(const UserAddressState()) {
    on<GetAddress>((event, emit) async {
      try {
        final position = await repo.getGeoLocationPosition();
        emit(UserAddressState(
            position: '${position.latitude},${position.longitude}'));
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
    });

    on<ChangeAddress>((event, emit) => {emit(const UserAddressState())});
  }

  @override
  AddressState? fromJson(Map<String, dynamic> json) {
    return UserAddressState(position: json['value'] as String);
  }

  @override
  Map<String, dynamic>? toJson(AddressState state) {
    return {'value': state.position};
  }
}
