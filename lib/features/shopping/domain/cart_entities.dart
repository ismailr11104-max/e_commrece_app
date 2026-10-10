import 'package:e_commrece_app/core/entities/product_entities.dart';

class CartEntities {
  final ProductEntities productEntities;
  int quantity;

  CartEntities({required this.productEntities, this.quantity = 0});

  num calculateTotalPrice() {
    return productEntities.price * quantity;
  }

  num calculateTotalWeight() {
    return productEntities.unitAmount * quantity;
  }

  void incrementQuantity() {
    quantity++;
  }

  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
    }
  }
}
