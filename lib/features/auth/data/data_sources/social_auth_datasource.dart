import 'package:e_commrece_app/features/auth/data/model/user_model.dart';

abstract class SocialAuthDatasource {
  Future<UserModel> signInWithGoogle();
  Future<UserModel> signInWithFacebook();
}
