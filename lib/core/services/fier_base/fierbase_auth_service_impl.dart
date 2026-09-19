import 'package:e_commrece_app/core/errors/exceptions.dart';
import 'package:e_commrece_app/core/services/fier_base/fierbase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FierBaseAuthServiceImpl extends FierBaseAuthService {
  final FirebaseAuth _firebaseAuth;

  FierBaseAuthServiceImpl(this._firebaseAuth);

  @override
  Future<User> createUser({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final user = credential.user;

      if (user == null) {
        throw const AuthException(
          'User not found after creating account.',
          code: 'user-null',
        );
      }

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw NetworkException('Network request failed.', code: e.code);
      }

      throw AuthException('Firebase authentication failed.', code: e.code);
    }
  }

  @override
  Future<User> signInWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = credential.user;
      if (user == null) {
        throw const AuthException(
          'User not found after sign in.',
          code: 'user-null',
        );
      }
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw NetworkException('Network request failed.', code: e.code);
      }
      throw AuthException('Firebase authentication failed.', code: e.code);
    }
  }
}
