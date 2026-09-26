import 'package:e_commrece_app/core/utils/backend_endpoint.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/user_data_source.dart';
import 'package:e_commrece_app/features/auth/domain/entities/user_entity.dart';
import 'package:e_commrece_app/features/auth/domain/repo/user_data_repository.dart';

class UserDataRepositoryImpl extends UserDataRepository {
  final UserDataSource _userDataSource;

  UserDataRepositoryImpl(this._userDataSource);

  @override
  Future<void> setData({required UserEntity user}) {
    return _userDataSource.setData(
      path: BackendEndpoint.addUserData,
      documentId: user.uid,
      data: user.toMap(),
    );
  }

  @override
  Future<dynamic> getData({required UserEntity user}) {
    return _userDataSource.getData(uId: user.uid);
  }

  @override
  Future<bool> checkIfData({required String path, required String documentId}) {
    return _userDataSource.checkIfData(path: path, documentId: documentId);
  }
}
