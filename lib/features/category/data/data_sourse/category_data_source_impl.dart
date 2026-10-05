import 'package:e_commrece_app/core/services/network/fire_store_service.dart';
import 'package:e_commrece_app/core/utils/backend_endpoint.dart';
import 'package:e_commrece_app/features/category/data/data_sourse/category_data_source.dart';
import 'package:e_commrece_app/features/category/data/model/category_model.dart';

class CategoryDataSourceImpl implements CategoryDataSource {
  final FireStoreService _storeService;

  CategoryDataSourceImpl(this._storeService);

  @override
  Future<List<CategoryModel>> getCategories() async {
    final result = await _storeService.getCollection(
      path: BackendEndpoint.getCategories,
    );
    return result.map((e) => CategoryModel.fromMap(e)).toList();
  }
}
