import 'package:e_commrece_app/features/checkout/domain/address_entities.dart';
import 'package:e_commrece_app/features/shopping/domain/cart_item_entities.dart';

class OrderEntities {
  final CartItemEntities cartItemEntities;
  final bool payWithCash;
  final AddressEntities addressEntities;

  OrderEntities(this.cartItemEntities, this.payWithCash, this.addressEntities);
}
