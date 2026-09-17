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
        throw ServerException('Failed to create user.');
      }
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw ValidationException('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw ValidationException('The account already exists for that email.');
      } else {
        throw ServerException('Failed to create user: ${e.toString()}');
      }
    } catch (e) {
      throw ServerException('Failed to create user: ${e.toString()}');
    }
  }
}
