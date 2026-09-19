import 'package:dartz/dartz.dart';
import 'package:e_commrece_app/core/errors/failures.dart';
import 'package:e_commrece_app/features/auth/data/model/user_model.dart';

abstract class SingInRepository {
  Future<Either<Failures, UserModel>> signInWithEmail({
    required String email,
    required String password,
  });
}
