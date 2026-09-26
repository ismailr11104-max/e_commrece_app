import 'package:dartz/dartz.dart';
import 'package:e_commrece_app/core/errors/exceptions.dart';
import 'package:e_commrece_app/core/errors/failures.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/sign_in_with_email_data_source.dart';
import 'package:e_commrece_app/features/auth/domain/entities/user_entity.dart';
import 'package:e_commrece_app/features/auth/domain/repo/sing_in_repository.dart';
import 'package:e_commrece_app/features/auth/domain/repo/user_data_repository.dart';

class SingInRepositoryImpl implements SingInRepository {
  final SignInWithEmailDataSource _emailDataSource;
  final UserDataRepository _userDataRepository;

  SingInRepositoryImpl(this._emailDataSource, this._userDataRepository);

  @override
  Future<Either<Failures, UserEntity>> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final user = await _emailDataSource.signInWithEmail(
        email: email,
        password: password,
      );
      final userEntity = await _userDataRepository.getData(user: user);
      return Right(userEntity);
    } on AuthException catch (e) {
      return Left(AuthFailure(_mapAuthError(e.code)));
    } on NetworkException catch (e) {
      return Left(NetworkFailure('تأكد من اتصالك بالإنترنت.'));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.'));
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
