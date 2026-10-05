import 'package:bloc/bloc.dart';
import 'package:e_commrece_app/core/enum/products_state.dart';
import 'package:e_commrece_app/core/repo/product_repo.dart';

import 'product_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this._productRepo) : super(const ProductsState());

  final ProductRepo _productRepo;

  Future<void> getAllProducts() async {
    emit(state.copyWith(status: ProductsStatus.loading, errorMessage: null));

    final result = await _productRepo.getAllProducts();

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: ProductsStatus.failure,
            errorMessage: failure.message,
          ),
        );
      },
      (products) {
        emit(
          state.copyWith(
            status: ProductsStatus.success,
            products: products,
            errorMessage: null,
          ),
        );
      },
    );
  }

  Future<void> getProductsByCategory(String categoryId) async {
    emit(state.copyWith(status: ProductsStatus.loading, errorMessage: null));

    final result = await _productRepo.getProductsByCategory(categoryId);

    result.fold(
      (failure) {
        emit(
          state.copyWith(
            status: ProductsStatus.failure,
            errorMessage: failure.message,
          ),
        );
      },
      (products) {
        emit(
          state.copyWith(
            status: ProductsStatus.success,
            products: products,
            errorMessage: null,
          ),
        );
      },
    );
  }
}
