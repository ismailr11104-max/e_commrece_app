import 'package:dartz/dartz.dart';
import 'package:e_commrece_app/core/errors/failures.dart';
import 'package:e_commrece_app/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> createEmailAndPassword({
    required String email,
    required String password,
    required String name,
  });
}
