part of 'address_bloc.dart';

@immutable
abstract class AddressState extends Equatable {
  final String? position;
  const AddressState(this.position);
  @override
  List<Object?> get props => [position];
}

class UserAddressState extends AddressState {
  const UserAddressState({String? position}) : super(position);
}
