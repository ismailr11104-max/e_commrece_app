import 'package:e_commrece_app/features/checkout/domain/address_entities.dart';
import 'package:e_commrece_app/features/shopping/domain/cart_item_entities.dart';

class OrderEntities {
  final String uId;
  final CartItemEntities cartItemEntities;
  bool? payWithCash;
  AddressEntities addressEntities;

  OrderEntities(
    this.cartItemEntities, {
    this.payWithCash,
    required this.uId,
    required this.addressEntities,
  });
}
