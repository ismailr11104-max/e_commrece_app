import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:e_commrece_app/core/errors/exceptions.dart';
import 'package:e_commrece_app/core/errors/failures.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/sign_in_with_email_data_source.dart';
import 'package:e_commrece_app/features/auth/data/model/user_model.dart';
import 'package:e_commrece_app/features/auth/domain/repo/sing_in_repository.dart';

class SingInRepositoryImpl implements SingInRepository {
  SignInWithEmailDataSource _emailDataSource;

  SingInRepositoryImpl(this._emailDataSource);

  @override
  Future<Either<Failures, UserModel>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _emailDataSource.signInWithEmail(
        email: email,
        password: password,
      );

      return Right(response);
    } on AuthException catch (e) {
      return Left(AuthFailure(_mapAuthError(e.code)));
    } on NetworkException {
      return Left(NetworkFailure('تأكد من اتصالك بالإنترنت.'));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e, stackTrace) {
      log(
        'Unexpected error while signing in',
        error: e,
        stackTrace: stackTrace,
      );

      return Left(ServerFailure('حدث خطأ غير متوقع، يرجى المحاولة لاحقًا.'));
    }
  }

  String _mapAuthError(String? code) {
    switch (code) {
      case 'invalid-credential':
      case 'user-not-found':
      case 'wrong-password':
        return 'البريد الإلكتروني أو كلمة المرور غير صحيحة.';

      case 'user-disabled':
        return 'تم تعطيل هذا الحساب.';

      case 'too-many-requests':
        return 'تم إجراء محاولات كثيرة، يرجى المحاولة لاحقًا.';

      default:
        return 'فشل تسجيل الدخول، يرجى المحاولة مرة أخرى.';
    }
  }
}
