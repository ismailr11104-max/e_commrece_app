import 'package:e_commrece_app/features/checkout/domain/entities/address_entities.dart';
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

  double calculateShippingCost() {
    if (payWithCash!) {
      return 30;
    } else {
      return 0;
    }
  }

  double calcualteShippingDiscount() {
    return 0;
  }

  double calculateTotalPriceAfterDiscountAndShipping() {
    return cartItemEntities.calculateTotal() +
        calculateShippingCost() -
        calcualteShippingDiscount();
  }

  @override
  String toString() {
    return 'OrderEntity{uID: $uId, cartEntity: $cartItemEntities, payWithCash: $payWithCash, shippingAddressEntity: $AddressEntities}';
  }
}
