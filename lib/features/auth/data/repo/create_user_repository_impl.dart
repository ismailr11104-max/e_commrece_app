import 'package:dartz/dartz.dart';
import 'package:e_commrece_app/core/errors/exceptions.dart';
import 'package:e_commrece_app/core/errors/failures.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/create_user_data_source.dart';
import 'package:e_commrece_app/features/auth/domain/entites/user_entity.dart';
import 'package:e_commrece_app/features/auth/domain/repo/create_user_repository.dart';

class CreateUserRepositoryImpl implements CreateUserRepository {
  final CreateUserDataSource _createUserDataSource;

  CreateUserRepositoryImpl(this._createUserDataSource);

  Future<Either<Failures, UserEntity>> createEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      final userModel = await _createUserDataSource.createUser(
        email: email,
        password: password,
      );

      return Right(userModel);
    } on AuthException catch (e) {
      return Left(AuthFailure(_mapAuthError(e.code)));
    } on NetworkException {
      return Left(NetworkFailure('تأكد من اتصالك بالإنترنت.'));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    }
  }

  String _mapAuthError(String? code) {
    switch (code) {
      case 'email-already-in-use':
        return 'هذا البريد الإلكتروني مستخدم بالفعل.';

      case 'invalid-email':
        return 'البريد الإلكتروني غير صالح.';

      case 'weak-password':
        return 'كلمة المرور ضعيفة.';

      case 'operation-not-allowed':
        return 'التسجيل باستخدام البريد الإلكتروني غير متاح حاليًا.';

      default:
        return 'فشل إنشاء الحساب، يرجى المحاولة مرة أخرى.';
    }
  }
}
