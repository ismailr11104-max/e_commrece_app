import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commrece_app/core/errors/exceptions.dart';
import 'package:e_commrece_app/core/errors/failures.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/create_user_data_source.dart';
import 'package:e_commrece_app/features/auth/data/model/user_model.dart';
import 'package:e_commrece_app/features/auth/domain/entites/user_entity.dart';
import 'package:e_commrece_app/features/auth/domain/repo/create_user_repository.dart';
import 'package:e_commrece_app/features/auth/domain/repo/user_data_repository.dart';

class CreateUserRepositoryImpl implements CreateUserRepository {
  final CreateUserDataSource _createUserDataSource;
  final UserDataRepository _userDataRepository;

  CreateUserRepositoryImpl(
    this._createUserDataSource,
    this._userDataRepository,
  );

  @override
  Future<Either<Failures, UserEntity>> createEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    UserModel? user;
    try {
      user = await _createUserDataSource.createUser(
        email: email,
        password: password,
      );
      UserEntity userEntity = UserEntity(
        name: name,
        uid: user.uid,
        email: email,
      );
      await _userDataRepository.addData(user: userEntity);
      return Right(userEntity);
    } on AuthException catch (e) {
      return Left(AuthFailure(_mapAuthError(e.code)));
    } on NetworkException {
      return Left(NetworkFailure('تأكد من اتصالك بالإنترنت.'));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on FirebaseException catch (e) {
      return Left(
        ServerFailure(e.message ?? 'حدث خطأ أثناء حفظ بيانات المستخدم.'),
      );
    } catch (e) {
      return Left(ServerFailure('حدث خطأ غير متوقع، يرجى المحاولة مرة أخرى.'));
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
