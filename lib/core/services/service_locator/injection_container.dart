import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commrece_app/core/services/fier_base/fierbase_auth_service.dart';
import 'package:e_commrece_app/core/services/fier_base/fierbase_auth_service_impl.dart';
import 'package:e_commrece_app/core/services/fier_base/fire_store_service.dart';
import 'package:e_commrece_app/core/services/fier_base/fire_store_service_impl.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/create_user_data_source.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/create_user_data_source_impl.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/sign_in_with_email_data_source.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/sign_in_with_email_data_source_impl.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/social_auth_datasource.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/social_auth_datasource_impl.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/user_data_source.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/user_data_source_impl.dart';
import 'package:e_commrece_app/features/auth/data/repo/create_user_repository_impl.dart';
import 'package:e_commrece_app/features/auth/data/repo/sing_in_repository_impl.dart';
import 'package:e_commrece_app/features/auth/data/repo/social_auth_repository_impl.dart';
import 'package:e_commrece_app/features/auth/data/repo/user_data_repository_impl.dart';
import 'package:e_commrece_app/features/auth/domain/repo/create_user_repository.dart';
import 'package:e_commrece_app/features/auth/domain/repo/sing_in_repository.dart';
import 'package:e_commrece_app/features/auth/domain/repo/social_auth_repository.dart';
import 'package:e_commrece_app/features/auth/domain/repo/user_data_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  // Firebase

  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);

  // Firebase Services

  sl.registerLazySingleton<FierBaseAuthService>(
    () => FierBaseAuthServiceImpl(sl<FirebaseAuth>()),
  );

  sl.registerLazySingleton<FireStoreService>(
    () => FireStoreServiceImpl(sl<FirebaseFirestore>()),
  );

  // =========================
  // User Data
  // =========================

  sl.registerLazySingleton<UserDataSource>(
    () => UserDataSourceImpl(sl<FireStoreService>()),
  );

  sl.registerLazySingleton<UserDataRepository>(
    () => UserDataRepositoryImpl(sl<UserDataSource>()),
  );

  // Create User
  sl.registerLazySingleton<CreateUserDataSource>(
    () => CreateUserDataImpl(sl<FierBaseAuthService>()),
  );

  sl.registerLazySingleton<CreateUserRepository>(
    () => CreateUserRepositoryImpl(
      sl<CreateUserDataSource>(),
      sl<UserDataRepository>(),
    ),
  );

  // Sign In With Email
  sl.registerLazySingleton<SignInWithEmailDataSource>(
    () => SignInWithEmailDataSourceImpl(sl<FierBaseAuthService>()),
  );

  sl.registerLazySingleton<SingInRepository>(
    () => SingInRepositoryImpl(
      sl<SignInWithEmailDataSource>(),
      sl<UserDataRepository>(),
    ),
  );

  // Social Auth
  sl.registerLazySingleton<SocialAuthDatasource>(
    () => SocialAuthDatasourceImpl(sl<FierBaseAuthService>()),
  );

  sl.registerLazySingleton<SocialAuthRepository>(
    () => SocialAuthRepositoryImpl(
      sl<SocialAuthDatasource>(),
      sl<CreateUserDataSource>(),
      sl<UserDataRepository>(),
    ),
  );
}
