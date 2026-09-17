import 'package:bloc/bloc.dart';
import 'package:e_commrece_app/features/auth/domain/entites/user_entity.dart';
import 'package:e_commrece_app/features/auth/domain/repo/auth_repo.dart';
import 'package:meta/meta.dart';

part 'email_auth_state.dart';

class EmailAuthCubit extends Cubit<EmailAuthState> {
  EmailAuthCubit({required this._authRepo}) : super(EmailAuthInitial());
  final AuthRepo _authRepo;
  Future<void> createEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(EmailAuthLoading());
    final result = await _authRepo.createEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
    result.fold(
      (failure) => emit(EmailAuthFailure(failure.message)),
      (user) => emit(EmailAuthSuccess(user)),
    );
  }
}
