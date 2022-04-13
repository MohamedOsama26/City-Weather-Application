part of 'address_bloc.dart';

@immutable
abstract class AddressState extends Equatable{
  // final AddressModel? addressModel;
  final String? position;
  const AddressState(this.position);
  // AddressInitial(this.addressModel);


  @override
  List<Object?> get props => [position];
}

class UserAddressState extends AddressState {

  const UserAddressState({ String? position}) : super(position);

}

// class AddressState1 extends AddressState {
//   AddressState1()
// }
