part of 'sign_up_auth_cubit.dart';

@immutable
sealed class EmailAuthState {}

final class EmailAuthInitial extends EmailAuthState {}

final class EmailAuthLoading extends EmailAuthState {}

final class EmailAuthSuccess extends EmailAuthState {
  final UserEntity userEntity;

  EmailAuthSuccess(this.userEntity);
}

final class EmailAuthFailure extends EmailAuthState {
  final String failure;

  EmailAuthFailure(this.failure);
}
