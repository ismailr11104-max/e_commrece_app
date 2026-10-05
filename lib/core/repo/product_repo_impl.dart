import 'package:dartz/dartz.dart';
import 'package:e_commrece_app/core/entities/product_entities.dart';
import 'package:e_commrece_app/core/errors/failures.dart';
import 'package:e_commrece_app/core/model/product_model.dart';
import 'package:e_commrece_app/core/repo/product_repo.dart';
import 'package:e_commrece_app/core/services/network/fire_store_service.dart';
import 'package:e_commrece_app/core/utils/backend_endpoint.dart';

class ProductRepoImpl implements ProductRepo {
  final FireStoreService _storeService;

  ProductRepoImpl(this._storeService);

  @override
  Future<Either<Failures, List<ProductEntities>>> getAllProducts() async {
    try {
      final result = await _storeService.getCollection(
        path: BackendEndpoint.getProduct,
      );

      final products = result
          .map((e) => ProductModel.fromMap(e).toEntities())
          .toList();
      return Right(products);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch products: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failures, List<ProductEntities>>>
  getBestSellingProduct() async {
    try {
      final result = await _storeService.getProductQuery(
        path: BackendEndpoint.getProduct,
        query: {'limit': 10, 'orderBy': 'sellingCount', 'descending': true},
      );
      final products = result
          .map((e) => ProductModel.fromMap(e).toEntities())
          .toList();

      return Right(products);
    } catch (e) {
      return Left(
        ServerFailure('Failed to fetch best selling products: ${e.toString()}'),
      );
    }
  }

  @override
  Future<Either<Failures, List<ProductEntities>>> getProductsByCategory(
    String categoryId,
  ) async {
    try {
      final result = await _storeService.getDataWhere(
        path: BackendEndpoint.getProduct,
        field: 'categoryId',
        value: categoryId,
      );

      final products = result
          .map((e) => ProductModel.fromMap(e).toEntities())
          .toList();

      return Right(products);
    } catch (e) {
      return Left(
        ServerFailure('Failed to fetch products by category: ${e.toString()}'),
      );
    }
  }
}
