import 'package:e_commrece_app/features/auth/domain/entities/user_entity.dart';
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

  Map<String, dynamic> toMap() {
    return {'name': name, 'uid': uid, 'email': email};
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(name: map['name'], uid: map['uid'], email: map['email']);
  }
}
