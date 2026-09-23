import 'package:e_commrece_app/features/auth/domain/entites/user_entity.dart';

abstract class UserDataRepository {
  Future addData({required UserEntity user});
}
