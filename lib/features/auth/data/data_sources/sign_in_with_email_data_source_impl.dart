import 'package:e_commrece_app/core/services/fier_base/fierbase_auth_service.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/sign_in_with_email_data_source.dart';
import 'package:e_commrece_app/features/auth/data/model/user_model.dart';
import 'package:e_commrece_app/features/auth/domain/entites/user_entity.dart';

class SignInWithEmailDataSourceImpl implements SignInWithEmailDataSource {
  final FierBaseAuthService _authService;

  SignInWithEmailDataSourceImpl(this._authService);

  @override
  Future<UserEntity> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final response = await _authService.signInWithEmail(
      email: email,
      password: password,
    );
    return UserModel.fromFirebaseUser(response);
  }
}
