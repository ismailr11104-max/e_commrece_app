import 'package:bloc/bloc.dart';
import 'package:e_commrece_app/core/entities/product_entities.dart';
import 'package:e_commrece_app/features/shopping/domain/cart_entities.dart';
import 'package:e_commrece_app/features/shopping/domain/cart_item_entities.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  CartItemEntities cartEntity = CartItemEntities([]);
  void addProduct(ProductEntities product) {
    bool isProduct = this.cartEntity.isExist(product);
    final cartItem = this.cartEntity.getCartItem(product);
    if (isProduct) {
      cartItem.incrementCount();
    } else {
      cartEntity.addCartItem(cartItem);
    }
    emit(CartItemAdd());
  }

  void removedProduct(CartEntities cartEntity) {
    this.cartEntity.removedCartItem(cartEntity);
    emit(CartItemRemoved());
  }
}
