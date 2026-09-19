import 'package:dartz/dartz.dart';
import 'package:e_commrece_app/core/errors/exceptions.dart';
import 'package:e_commrece_app/core/errors/failures.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/social_auth_datasource.dart';
import 'package:e_commrece_app/features/auth/domain/entites/user_entity.dart';
import 'package:e_commrece_app/features/auth/domain/repo/social_auth_repository.dart';

class SocialAuthRepositoryImpl implements SocialAuthRepository {
  SocialAuthDatasource _socialAuthDatasource;

  SocialAuthRepositoryImpl(this._socialAuthDatasource);

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    try {
      final result = await _socialAuthDatasource.signInWithGoogle();
      return Right(result);
    } on AuthException catch (e) {
      return Left(AuthFailure(_mapGoogleAuthError(e.code)));
    } on NetworkException {
      return Left(NetworkFailure('تأكد من اتصالك بالإنترنت.'));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع، يرجى المحاولة لاحقًا.'));
    }
  }
}

String _mapGoogleAuthError(String? code) {
  switch (code) {
    case 'canceled':
      return 'تم إلغاء تسجيل الدخول باستخدام Google.';

    case 'network-request-failed':
      return 'تأكد من اتصالك بالإنترنت.';

    case 'account-exists-with-different-credential':
      return 'يوجد حساب مرتبط بهذا البريد بطريقة تسجيل دخول أخرى.';

    case 'user-disabled':
      return 'تم تعطيل هذا الحساب.';

    default:
      return 'فشل تسجيل الدخول باستخدام Google، يرجى المحاولة مرة أخرى.';
  }
}
