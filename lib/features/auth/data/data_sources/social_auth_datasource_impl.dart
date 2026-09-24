import 'package:e_commrece_app/core/errors/exceptions.dart';
import 'package:e_commrece_app/core/services/fier_base/fierbase_auth_service.dart';
import 'package:e_commrece_app/features/auth/data/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'social_auth_datasource.dart';

class SocialAuthDatasourceImpl implements SocialAuthDatasource {
  final FierBaseAuthService _authService;

  SocialAuthDatasourceImpl(this._authService);

  @override
  Future<UserModel> signInWithGoogle() async {
    try {
      final response = await _authService.signInWithGoogle();
      return UserModel.fromFirebaseUser(response);
    } on AuthException {
      rethrow;
    } on NetworkException {
      rethrow;
    } on FirebaseException catch (e) {
      throw ServerException(
        e.message ?? 'حدث خطأ أثناء تسجيل الدخول.',
        code: e.code,
      );
    } catch (e) {
      throw ServerException('حدث خطأ أثناء  تسجيل الدخول: ${e.toString()}');
    }
  }

  @override
  Future<UserModel> signInWithFacebook() async {
    try {
      final response = await _authService.signInWithFacebook();
      return UserModel.fromFirebaseUser(response);
    } on AuthException {
      rethrow;
    } on NetworkException {
      rethrow;
    } on FirebaseException catch (e) {
      throw ServerException(
        e.message ?? 'حدث خطأ أثناء تسجيل الدخول.',
        code: e.code,
      );
    } catch (e) {
      throw ServerException('حدث خطأ أثناء  تسجيل الدخول: ${e.toString()}');
    }
  }
}
