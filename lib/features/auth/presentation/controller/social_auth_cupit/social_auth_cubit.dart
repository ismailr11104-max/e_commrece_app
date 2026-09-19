import 'package:bloc/bloc.dart';
import 'package:e_commrece_app/features/auth/domain/entites/user_entity.dart';
import 'package:e_commrece_app/features/auth/domain/repo/social_auth_repository.dart';
import 'package:meta/meta.dart';

part 'social_auth_state.dart';

class SocialAuthCubit extends Cubit<SocialAuthState> {
  SocialAuthCubit({required this._authRepository}) : super(SocialAuthInitial());

  final SocialAuthRepository _authRepository;

  Future<void> signInWithGoogle() async {
    emit(SocialAuthLoading());

    final result = await _authRepository.signInWithGoogle();

    result.fold(
      (failure) {
        emit(SocialAuthFailure(failure.message));
      },
      (user) {
        emit(SocialAuthSuccess(user));
      },
    );
  }
}
