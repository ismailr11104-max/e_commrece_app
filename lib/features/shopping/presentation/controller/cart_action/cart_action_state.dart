part of 'cart_action_cubit.dart';

@immutable
sealed class CartActionState {}

final class CartActionInitial extends CartActionState {}

final class CartActionUpdate extends CartActionState {
  final CartEntities cartEntity;
  CartActionUpdate(this.cartEntity);
}
