import 'package:e_commrece_app/core/helper_functions/get_currency.dart';
import 'package:e_commrece_app/features/shopping/domain/cart_entities.dart';

class ItemEntity {
  String? name;
  int? quantity;
  String? price;
  String? currency;

  ItemEntity({this.name, this.quantity, this.price, this.currency});

  Map<String, dynamic> toJson() => {
    'name': name,
    'quantity': quantity,
    'price': price,
    'currency': currency,
  };

  factory ItemEntity.fromEntity(CartEntities itemEntity) {
    return ItemEntity(
      name: itemEntity.productEntities.name,
      quantity: itemEntity.quantity,
      price: itemEntity.productEntities.price.toString(),
      currency: getCurrency(),
    );
  }
}
