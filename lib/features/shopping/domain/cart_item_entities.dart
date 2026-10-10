import 'package:e_commrece_app/core/entities/product_entities.dart';
import 'package:e_commrece_app/features/shopping/domain/cart_entities.dart';

class CartItemEntities {
  final List<CartEntities> cartItem;

  CartItemEntities(this.cartItem);

  double calculateTotal() {
    double total = 0;
    for (var cartItems in cartItem) {
      total += cartItems.calculateTotalPrice();
    }
    return total;
  }

  void addCartItem(CartEntities cartEntities) {
    cartItem.add(cartEntities);
  }

  bool isExist(ProductEntities product) {
    for (var cartItems in cartItem) {
      if (cartItems.productEntities == product) {
        return true;
      }
    }
    return false;
  }

  CartEntities getCartItem(ProductEntities product) {
    for (var cartItems in cartItem) {
      if (cartItems.productEntities == product) {
        return cartItems;
      }
    }
    return CartEntities(productEntities: product, quantity: 1);
  }

  bool removedCartItem(CartEntities cartEntities) {
    return cartItem.remove(cartEntities);
  }
}
