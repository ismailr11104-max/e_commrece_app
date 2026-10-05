import 'package:e_commrece_app/features/category/data/model/category_model.dart';

abstract class CategoryDataSource {
  Future<List<CategoryModel>> getCategories();
}
