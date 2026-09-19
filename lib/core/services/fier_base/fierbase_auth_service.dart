import 'package:firebase_auth/firebase_auth.dart';

abstract class FierBaseAuthService {
  Future<User> createUser({required String email, required String password});
  Future<User> signInWithEmail({
    required String email,
    required String password,
  });
  Future<UserCredential> signInWithGoogle();
}
