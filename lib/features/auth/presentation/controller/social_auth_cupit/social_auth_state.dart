part of 'social_auth_cubit.dart';

@immutable
sealed class SocialAuthState {}

final class SocialAuthInitial extends SocialAuthState {}

class SocialAuthLoading extends SocialAuthState {
  final SocialProvider provider;

  SocialAuthLoading(this.provider);
}

final class SocialAuthSuccess extends SocialAuthState {
  final UserEntity userEntity;

  SocialAuthSuccess(this.userEntity);
}

final class SocialAuthFailure extends SocialAuthState {
  final String failure;

  SocialAuthFailure(this.failure);
}
