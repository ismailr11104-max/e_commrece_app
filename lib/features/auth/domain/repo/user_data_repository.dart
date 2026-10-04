import 'package:e_commrece_app/features/auth/data/model/user_model.dart';

abstract class UserDataRepository {
  Future<void> setData({required UserModel user});
  Future<UserModel> getData({required UserModel user});
  Future<bool> checkIfData({required String path, required String documentId});
  Future<void> saveData({required UserModel user});
}
