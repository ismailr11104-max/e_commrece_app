import 'package:e_commrece_app/features/auth/data/model/user_model.dart';

abstract class CreateUserDataSource {
  Future<UserModel> createUser({
    required String email,
    required String password,
  });

  Future deleteUser();
}
