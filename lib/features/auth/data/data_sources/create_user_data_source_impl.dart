import 'package:e_commrece_app/core/errors/exceptions.dart';
import 'package:e_commrece_app/core/services/fier_base/fierbase_auth_service.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/create_user_data_source.dart';
import 'package:e_commrece_app/features/auth/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CreateUserDataImpl implements CreateUserDataSource {
  final FierBaseAuthService _authService;

  CreateUserDataImpl(this._authService);

  @override
  Future<UserModel> createUser({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _authService.createUser(
        email: email,
        password: password,
      );

      return UserModel.fromFirebaseUser(response);
    } on AuthException {
      rethrow;
    } on NetworkException {
      rethrow;
    } on FirebaseException catch (e) {
      throw ServerException(
        e.message ?? 'حدث خطأ أثناء إنشاء الحساب.',
        code: e.code,
      );
    } catch (e) {
      throw ServerException('حدث خطأ أثناء إنشاء الحساب: ${e.toString()}');
    }
  }

  Future<void> deleteUser() async {
    await _authService.deleteUser();
  }
}
