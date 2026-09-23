import 'package:e_commrece_app/core/services/fier_base/fire_store_service.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/user_data_source.dart';

class UserDataSourceImpl implements UserDataSource {
  final FireStoreService _fireStoreService;

  UserDataSourceImpl(this._fireStoreService);

  Future<void> setData({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    await _fireStoreService.setData(
      path: path,
      documentId: documentId,
      data: data,
    );
  }
}
