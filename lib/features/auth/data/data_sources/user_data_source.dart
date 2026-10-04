import 'package:e_commrece_app/features/auth/data/model/user_model.dart';

abstract class UserDataSource {
  Future<void> setData({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  });
  Future<UserModel> getData({required String uId});
  Future<bool> checkIfData({required String path, required String documentId});
}
