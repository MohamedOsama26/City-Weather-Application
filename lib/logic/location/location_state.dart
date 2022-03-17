part of 'location_bloc.dart';

class LocationState extends Equatable{

  @override
  List<Object> get props => [];
}

class LocationInitial extends LocationState{}

class LocationIsLoaded extends LocationState{
  final Position _position;
  LocationIsLoaded(this._position);

  Position get getLocation => _position;

  @override
  List<Object> get props => [_position];
}

class LocationIsNotLoaded extends LocationState {}