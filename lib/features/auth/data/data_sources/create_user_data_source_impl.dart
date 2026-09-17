import 'package:e_commrece_app/core/services/fier_base/fierbase_auth_service.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/create_user_data_source.dart';
import 'package:e_commrece_app/features/auth/data/model/user_model.dart';

class CreateUserDataImpl implements CreateUserDataSource {
  final FierBaseAuthService _authService;
  CreateUserDataImpl(this._authService);
  @override
  Future<UserModel> createUser({
    required String email,
    required String password,
  }) async {
    final response = await _authService.createUser(
      email: email,
      password: password,
    );

    return UserModel.fromFirebaseUser(response);
  }
}
