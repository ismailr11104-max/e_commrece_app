import 'package:e_commrece_app/core/utils/backend_endpoint.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/user_data_source.dart';
import 'package:e_commrece_app/features/auth/domain/entites/user_entity.dart';
import 'package:e_commrece_app/features/auth/domain/repo/user_data_repository.dart';

class UserDataRepositoryImpl extends UserDataRepository {
  final UserDataSource _userDataSource;

  UserDataRepositoryImpl(this._userDataSource);

  @override
  Future<void> addData({required UserEntity user}) async {
    await _userDataSource.setData(
      path: BackendEndpoint.addUserData,
      documentId: user.uid,
      data: user.toMap(),
    );
  }
}
