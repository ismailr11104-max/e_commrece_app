import 'package:e_commrece_app/core/services/fier_base/fierbase_auth_service.dart';
import 'package:e_commrece_app/features/auth/data/model/user_model.dart';

import 'social_auth_datasource.dart';

class SocialAuthDatasourceImpl implements SocialAuthDatasource {
  final FierBaseAuthService _authService;

  SocialAuthDatasourceImpl(this._authService);

  @override
  Future<UserModel> signInWithGoogle() async {
    final response = await _authService.signInWithGoogle();
    return UserModel.fromFirebaseUser(response);
  }

  @override
  Future<UserModel> signInWithFacebook() async {
    final response = await _authService.signInWithFacebook();
    return UserModel.fromFirebaseUser(response);
  }
}
