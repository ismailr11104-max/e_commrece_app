import 'package:dartz/dartz.dart';
import 'package:e_commrece_app/core/errors/failures.dart';
import 'package:e_commrece_app/features/category/domain/entities/category_entities.dart';

abstract class CategoryRepository {
  Future<Either<Failures, List<CategoryEntities>>> getCategories();
}
