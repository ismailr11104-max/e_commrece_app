import 'package:e_commrece_app/features/auth/domain/entities/user_entity.dart';

abstract class SignInWithEmailDataSource {
  Future<UserEntity> signInWithEmail({
    required String email,
    required String password,
  });
}
