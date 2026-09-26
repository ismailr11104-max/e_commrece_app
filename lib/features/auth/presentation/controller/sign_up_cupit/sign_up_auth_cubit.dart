import 'package:bloc/bloc.dart';
import 'package:e_commrece_app/features/auth/domain/entities/user_entity.dart';
import 'package:e_commrece_app/features/auth/domain/repo/create_user_repository.dart';
import 'package:meta/meta.dart';

part 'sign_up_auth_state.dart';

class EmailAuthCubit extends Cubit<EmailAuthState> {
  EmailAuthCubit({required this._authRepo}) : super(EmailAuthInitial());
  final CreateUserRepository _authRepo;
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
