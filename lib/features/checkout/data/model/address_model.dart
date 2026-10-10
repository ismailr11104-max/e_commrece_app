import 'package:e_commrece_app/features/checkout/domain/address_entities.dart';

class AddressModel {
  String? name;
  String? phone;
  String? address;
  String? email;
  String? floorDetails;

  AddressModel({
    this.name,
    this.phone,
    this.address,
    this.floorDetails,
    this.email,
  });

  factory AddressModel.fromEntity(AddressEntities entity) {
    return AddressModel(
      name: entity.fullName,
      phone: entity.phone,
      address: entity.address,
      floorDetails: entity.floorDetails,
      email: entity.email,
    );
  }

  @override
  String toString() {
    return ' $address,$floorDetails';
  }

  toJson() {
    return {
      'name': name,
      'phone': phone,
      'address': address,
      'floorDetails': floorDetails,
      'email': email,
    };
  }
}
