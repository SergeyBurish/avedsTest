import 'package:aveds_test/di/injector.dart';
import 'package:aveds_test/di/locator.dart';
import 'package:aveds_test/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:aveds_test/router/app_router.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final AppRouter router = AppRouter();

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: const <Locale>[Locale('en', 'US'), Locale('ru', 'RU')],
      path: 'l10n',
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(authManager: Locator.authManager),
      child: MaterialApp.router(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        routerConfig: router.config(),
      ),
    );
  }
}
