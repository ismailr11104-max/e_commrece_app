import 'package:e_commrece_app/features/auth/data/model/user_model.dart';

abstract class SignInWithEmailDataSource {
  Future<UserModel> signInWithEmail({
    required String email,
    required String password,
  });
}
