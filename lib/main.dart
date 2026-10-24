import 'package:device_preview/device_preview.dart';
import 'package:e_commrece_app/core/services/observer/custom_observer.dart';
import 'package:e_commrece_app/core/services/shared_preferences/shared_pref_manger.dart';
import 'package:e_commrece_app/core/utils/app_colors.dart';
import 'package:e_commrece_app/features/splash/presentation/splash_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'core/helper_functions/on_generate_routes.dart';
import 'core/services/service_locator/injection_container.dart';
import 'firebase_options.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPrefManger().init();
  Bloc.observer = CustomObserver();
  await initDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (kIsWeb) {
    await GoogleSignIn.instance.initialize(
      clientId:
          '473106444167-fs4ecku3drnhpt2nrdlntlnnmdh4vo93.apps.googleusercontent.com',
    );
  } else {
    await GoogleSignIn.instance.initialize(
      serverClientId:
          '473106444167-fs4ecku3drnhpt2nrdlntlnnmdh4vo93.apps.googleusercontent.com',
    );
  }
  runApp(DevicePreview(enabled: true, builder: (context) => const FruitHub()));
}

class FruitHub extends StatelessWidget {
  const FruitHub({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          locale: Locale('ar'),
          builder: (context, widget) {
            return DevicePreview.appBuilder(context, widget);
          },
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            fontFamily: 'Cairo',
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
          ),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          onGenerateRoute: onGenerateRoutes,
          initialRoute: SplashView.routeName,
        );
      },
    );
  }
}
