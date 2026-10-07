import 'package:e_commrece_app/core/entities/product_entities.dart';
import 'package:e_commrece_app/core/enum/products_state.dart';
import 'package:flutter/foundation.dart';

@immutable
class ProductsState {
  const ProductsState({
    this.productsStatus = ProductsStatus.initial,
    this.products = const [],
    this.errorMessage,
  });

  final ProductsStatus productsStatus;
  final List<ProductEntities> products;
  final String? errorMessage;

  ProductsState copyWith({
    ProductsStatus? status,
    List<ProductEntities>? products,
    String? errorMessage,
  }) {
    return ProductsState(
      productsStatus: status ?? this.productsStatus,
      products: products ?? this.products,
      errorMessage: errorMessage,
    );
  }
}
