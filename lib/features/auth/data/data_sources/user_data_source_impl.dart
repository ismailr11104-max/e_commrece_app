import 'package:e_commrece_app/core/services/fier_base/fire_store_service.dart';
import 'package:e_commrece_app/core/utils/backend_endpoint.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/user_data_source.dart';
import 'package:e_commrece_app/features/auth/data/model/user_model.dart';
import 'package:e_commrece_app/features/auth/domain/entities/user_entity.dart';

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

  @override
  Future<UserEntity> getData({required String uId}) async {
    final userdata = await _fireStoreService.getData(
      path: BackendEndpoint.getUserData,
      documentId: uId,
    );
    return UserModel.fromJson(userdata);
  }

  @override
  Future<bool> checkIfData({
    required String path,
    required String documentId,
  }) async {
    return await _fireStoreService.checkIfData(
      path: path,
      documentId: documentId,
    );
  }
}
