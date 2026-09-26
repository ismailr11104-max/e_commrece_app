import 'package:e_commrece_app/features/auth/domain/entities/user_entity.dart';

abstract class UserDataSource {
  Future<void> setData({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  });

  Future<UserEntity> getData({required String uId});
  Future<bool> checkIfData({required String path, required String documentId});
}
