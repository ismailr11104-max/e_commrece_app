import 'package:dartz/dartz.dart';
import 'package:e_commrece_app/core/errors/failures.dart';
import 'package:e_commrece_app/features/category/data/data_sourse/category_data_source.dart';
import 'package:e_commrece_app/features/category/domain/entities/category_entities.dart';
import 'package:e_commrece_app/features/category/domain/repo/category_repository.dart';

class CategoryRepoImpl implements CategoryRepository {
  final CategoryDataSource _dataSource;
  CategoryRepoImpl(this._dataSource);
  @override
  Future<Either<Failures, List<CategoryEntities>>> getCategories() async {
    try {
      final result = await _dataSource.getCategories();
      return Right(result);
    } catch (e) {
      return Left(ServerFailure('Failed to fetch categories: ${e.toString()}'));
    }
  }
}
