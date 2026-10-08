import 'package:e_commrece_app/core/entities/product_entities.dart';

class CartEntities {
  final ProductEntities productEntities;
  int count;

  CartEntities({required this.productEntities, this.count = 0});

  num calculateTotalPrice() {
    return productEntities.price * count;
  }

  num calculateTotalWeight() {
    return productEntities.unitAmount * count;
  }

  void incrementCount() {
    count++;
  }

  void decrementCount() {
    if (count > 1) {
      count--;
    }
  }
}
