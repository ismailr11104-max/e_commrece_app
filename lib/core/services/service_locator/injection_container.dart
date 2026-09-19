import 'package:e_commrece_app/core/services/fier_base/fierbase_auth_service.dart';
import 'package:e_commrece_app/core/services/fier_base/fierbase_auth_service_impl.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/create_user_data_source.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/create_user_data_source_impl.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/sign_in_with_email_data_source.dart';
import 'package:e_commrece_app/features/auth/data/data_sources/sign_in_with_email_data_source_impl.dart';
import 'package:e_commrece_app/features/auth/data/repo/create_user_repository_impl.dart';
import 'package:e_commrece_app/features/auth/data/repo/sing_in_repository_impl.dart';
import 'package:e_commrece_app/features/auth/domain/repo/create_user_repository.dart';
import 'package:e_commrece_app/features/auth/domain/repo/sing_in_repository.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initDependencies() async {
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);

  sl.registerLazySingleton<FierBaseAuthService>(
    () => FierBaseAuthServiceImpl(sl<FirebaseAuth>()),
  );

  sl.registerLazySingleton<CreateUserDataSource>(
    () => CreateUserDataImpl(sl<FierBaseAuthService>()),
  );

  sl.registerLazySingleton<CreateUserRepository>(
    () => CreateUserRepositoryImpl(sl<CreateUserDataSource>()),
  );

  sl.registerLazySingleton<SignInWithEmailDataSource>(
    () => SignInWithEmailDataSourceImpl(sl<FierBaseAuthService>()),
  );

  sl.registerLazySingleton<SingInRepository>(
    () => SingInRepositoryImpl(sl<SignInWithEmailDataSource>()),
  );
}
