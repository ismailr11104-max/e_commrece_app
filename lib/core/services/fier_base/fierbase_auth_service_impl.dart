import 'package:e_commrece_app/core/errors/exceptions.dart';
import 'package:e_commrece_app/core/services/fier_base/fierbase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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

  Future<User> signInWithEmail({
    required String email,
    required String password,
  }) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    final user = credential.user;

    if (user == null) {
      throw const AuthException(
        'User is null after successful sign in.',
        code: 'user-null',
      );
    }

    return user;
  }

  @override
  Future<User> signInWithGoogle() async {
    try {
      final GoogleSignInAccount googleUser = await GoogleSignIn.instance
          .authenticate();

      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
      );
      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );
      final user = userCredential.user;

      if (user == null) {
        throw const AuthException(
          'User not found after Google sign in.',
          code: 'user-null',
        );
      }

      return user;
    } on GoogleSignInException catch (e) {
      if (e.code == GoogleSignInExceptionCode.canceled) {
        throw AuthException(
          'Google sign in was canceled.',
          code: e.code.toString(),
        );
      }

      throw AuthException(
        'Google authentication failed.',
        code: e.code.toString(),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw NetworkException('Network request failed.', code: e.code);
      }
      throw AuthException('Firebase authentication failed.', code: e.code);
    }
  }

  @override
  Future<User> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.status != LoginStatus.success ||
          loginResult.accessToken == null) {
        throw AuthException(
          'Facebook sign in was canceled or failed.',
          code: loginResult.status.name,
        );
      }

      final credential = FacebookAuthProvider.credential(
        loginResult.accessToken!.tokenString,
      );
      final userCredential = await _firebaseAuth.signInWithCredential(
        credential,
      );

      final user = userCredential.user;

      if (user == null) {
        throw const AuthException(
          'User not found after Facebook sign in.',
          code: 'user-null',
        );
      }
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'network-request-failed') {
        throw NetworkException('Network request failed.', code: e.code);
      }
      throw AuthException('Facebook authentication failed.', code: e.code);
    }
  }

  @override
  Future<void> deleteUser() async {
    await _firebaseAuth.currentUser!.delete();
  }
}
