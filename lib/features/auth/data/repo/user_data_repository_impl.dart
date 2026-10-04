import 'dart:convert';

import 'package:e_commrece_app/core/connstens/const.dart';
import 'package:e_commrece_app/core/services/shared_preferences/shared_pref_manger.dart';
import 'package:e_commrece_app/core/utils/backend_endpoint.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/user_data_source.dart';
import 'package:e_commrece_app/features/auth/data/model/user_model.dart';
import 'package:e_commrece_app/features/auth/domain/repo/user_data_repository.dart';

class UserDataRepositoryImpl extends UserDataRepository {
  final UserDataSource _userDataSource;

  UserDataRepositoryImpl(this._userDataSource);

  @override
  Future<void> setData({required UserModel user}) {
    return _userDataSource.setData(
      path: BackendEndpoint.addUserData,
      documentId: user.uid,
      data: user.toMap(),
    );
  }

  @override
  Future<UserModel> getData({required UserModel user}) {
    return _userDataSource.getData(uId: user.uid);
  }

  @override
  Future<bool> checkIfData({required String path, required String documentId}) {
    return _userDataSource.checkIfData(path: path, documentId: documentId);
  }

  @override
  Future<void> saveData({required UserModel user}) {
    final jsonData = jsonEncode(user.toMap());
    return SharedPrefManger().setString(KUserData, jsonData);
  }
}
