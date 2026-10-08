import 'package:bloc/bloc.dart';
import 'package:e_commrece_app/features/shopping/domain/cart_entities.dart';
import 'package:meta/meta.dart';

part 'cart_action_state.dart';

class CartActionCubit extends Cubit<CartActionState> {
  CartActionCubit() : super(CartActionInitial());

  void cartItemUpdated(CartEntities cartEntity) {
    emit(CartActionUpdate(cartEntity));
  }
}
