part of 'social_auth_cubit.dart';

@immutable
sealed class SocialAuthState {}

final class SocialAuthInitial extends SocialAuthState {}

final class SocialAuthLoading extends SocialAuthState {}

final class SocialAuthSuccess extends SocialAuthState {
  final UserEntity userEntity;

  SocialAuthSuccess(this.userEntity);
}

final class SocialAuthFailure extends SocialAuthState {
  final String failure;

  SocialAuthFailure(this.failure);
}
