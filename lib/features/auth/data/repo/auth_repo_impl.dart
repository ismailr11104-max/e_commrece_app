import 'package:dartz/dartz.dart';
import 'package:e_commrece_app/core/errors/exceptions.dart';
import 'package:e_commrece_app/core/errors/failures.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/create_user_data_source.dart';
import 'package:e_commrece_app/features/auth/domain/entites/user_entity.dart';
import 'package:e_commrece_app/features/auth/domain/repo/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final CreateUserDataSource _createUserDataSource;

  AuthRepoImpl(this._createUserDataSource);

  @override
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
      return Left(AuthFailure(e.message));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } catch (e) {
      return Left(ServerFailure('Unexpected error: ${e.toString()}'));
    }
  }
}
