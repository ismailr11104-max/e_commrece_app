part of 'sign_in_cubit.dart';

@immutable
sealed class SignInState {}

final class SignInAuthInitial extends SignInState {}

final class SignInAuthLoading extends SignInState {}

final class SignInAuthSuccess extends SignInState {
  final UserEntity userEntity;

  SignInAuthSuccess(this.userEntity);
}

final class SignInAuthFailure extends SignInState {
  final String failure;

  SignInAuthFailure(this.failure);
}
