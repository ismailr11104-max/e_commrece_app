import 'package:e_commrece_app/features/auth/domain/entities/user_entity.dart';

abstract class UserDataRepository {
  Future setData({required UserEntity user});
  Future getData({required UserEntity user});
  Future<bool> checkIfData({required String path, required String documentId});
}
