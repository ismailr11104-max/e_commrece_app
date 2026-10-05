import 'package:bloc/bloc.dart';
import 'package:e_commrece_app/core/entities/product_entities.dart';
import 'package:e_commrece_app/core/repo/product_repo.dart';
import 'package:meta/meta.dart';

part 'best_selling_state.dart';

class BestSellingCubit extends Cubit<BestSellingState> {
  BestSellingCubit(this._productRepo) : super(BestSellingInitial());

  final ProductRepo _productRepo;

  Future<void> getBestSellingProduct() async {
    emit(BestSellingLoading());
    await Future.delayed(const Duration(seconds: 3));
    final result = await _productRepo.getBestSellingProduct();

    result.fold(
      (failure) => emit(BestSellingFailure(failure.message)),
      (products) => emit(BestSellingSuccess(products)),
    );
  }
}
