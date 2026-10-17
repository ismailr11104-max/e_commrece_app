import 'package:bloc/bloc.dart';
import 'package:e_commrece_app/core/entities/product_entities.dart';
import 'package:e_commrece_app/features/shopping/domain/cart_entities.dart';
import 'package:e_commrece_app/features/shopping/domain/cart_item_entities.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  CartItemEntities cartEntity = CartItemEntities([]);
  void addProduct(ProductEntities product, {int count = 1}) {
    bool isProduct = this.cartEntity.isExist(product);
    final cartItem = this.cartEntity.getCartItem(product);
    if (isProduct) {
      cartItem.quantity += count;
    } else {
      cartItem.quantity = count;
      cartEntity.addCartItem(cartItem);
    }
    emit(CartInitial());
    emit(CartItemAdd());
  }

  void removedProduct(CartEntities cartEntity) {
    this.cartEntity.removedCartItem(cartEntity);
    emit(CartItemRemoved());
  }
}
