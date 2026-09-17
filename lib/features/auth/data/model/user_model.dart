import 'package:e_commrece_app/features/auth/domain/entites/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel extends UserEntity {
  UserModel({required super.name, required super.uid, required super.email});

  factory UserModel.fromFirebaseUser(User user) {
    return UserModel(
      name: user.displayName ?? '',
      uid: user.uid,
      email: user.email ?? '',
    );
  }
}
