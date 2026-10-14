class AddressEntities {
  String? fullName;
  String? phone;
  String? address;
  String? email;
  String? floorDetails;

  AddressEntities({
    this.fullName,
    this.phone,
    this.address,
    this.email,
    this.floorDetails,
  });

  @override
  String toString() {
    return ' $address,$floorDetails';
  }
}
