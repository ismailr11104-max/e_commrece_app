import 'package:dartz/dartz.dart';
import 'package:e_commrece_app/core/entities/product_entities.dart';
import 'package:e_commrece_app/core/errors/failures.dart';

abstract class ProductRepo {
  Future<Either<Failures, List<ProductEntities>>> getAllProducts();

  Future<Either<Failures, List<ProductEntities>>> getBestSellingProduct();

  Future<Either<Failures, List<ProductEntities>>> getProductsByCategory(
    String categoryId,
  );
}
