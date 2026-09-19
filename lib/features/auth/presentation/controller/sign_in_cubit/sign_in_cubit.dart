import 'package:bloc/bloc.dart';
import 'package:e_commrece_app/features/auth/domain/entites/user_entity.dart';
import 'package:e_commrece_app/features/auth/domain/repo/sing_in_repository.dart';
import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this._singInRepository}) : super(SignInAuthInitial());
  final SingInRepository _singInRepository;

  Future<void> signInWithEmail({
    required String email,
    required String password,
  }) async {
    emit(SignInAuthLoading());
    final result = await _singInRepository.signInWithEmail(
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(SignInAuthFailure(failure.message)),
      (user) => emit(SignInAuthSuccess(user)),
    );
  }
}
