import 'package:bloc/bloc.dart';
import 'package:e_commrece_app/core/repo/order_repo.dart';
import 'package:e_commrece_app/features/checkout/domain/order_entities.dart';
import 'package:meta/meta.dart';

part 'add_order_state.dart';

class AddOrderCubit extends Cubit<AddOrderState> {
  AddOrderCubit(this._orderRepo) : super(AddOrderInitial());

  OrderRepo _orderRepo;

  void addOrder({required OrderEntities orderEntity}) async {
    emit(AddOrderLoading());
    final result = await _orderRepo.addOrder(orderEntity: orderEntity);
    result.fold(
      (error) => emit(AddOrderFailure(error.message)),
      (_) => emit(AddOrderSuccess()),
    );
  }
}
