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
      return Left(AuthFailure(_mapSocialAuthError(e.code)));
    } on NetworkException {
      return Left(NetworkFailure('تأكد من اتصالك بالإنترنت.'));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع، يرجى المحاولة لاحقًا.'));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithFacebook() async {
    try {
      final result = await _socialAuthDatasource.signInWithFacebook();
      return Right(result);
    } on AuthException catch (e) {
      return Left(AuthFailure(_mapSocialAuthError(e.code)));
    } on NetworkException {
      return Left(NetworkFailure('تأكد من اتصالك بالإنترنت.'));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع، يرجى المحاولة لاحقًا.'));
    }
  }
}

String _mapSocialAuthError(String? code) {
  switch (code) {
    case 'canceled':
    case 'popup-closed-by-user':
      return 'تم إلغاء تسجيل الدخول.';

    case 'network-request-failed':
      return 'تأكد من اتصالك بالإنترنت.';

    case 'account-exists-with-different-credential':
      return 'يوجد حساب مرتبط بهذا البريد بطريقة تسجيل دخول أخرى.';

    case 'user-disabled':
      return 'تم تعطيل هذا الحساب.';

    case 'invalid-credential':
      return 'بيانات تسجيل الدخول غير صالحة، يرجى المحاولة مرة أخرى.';

    case 'operation-not-allowed':
      return 'طريقة تسجيل الدخول هذه غير متاحة حاليًا.';

    case 'credential-already-in-use':
      return 'بيانات تسجيل الدخول هذه مرتبطة بحساب آخر.';

    default:
      return 'فشل تسجيل الدخول، يرجى المحاولة مرة أخرى.';
  }
}
