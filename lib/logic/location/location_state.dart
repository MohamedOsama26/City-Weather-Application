part of 'location_bloc.dart';

class LocationState extends Equatable {
  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState {}

class LocationIsLoaded extends LocationState {
  final Position _position;
  final Placemark _details;

  LocationIsLoaded(this._position, this._details);

  Position get getLocation => _position;
  Placemark get getAddress => _details;

  @override
  List<Object> get props => [_position, _details];
}

class LocationIsDisabled extends LocationState {}