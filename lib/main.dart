import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_app_task/core/themes/app_theme.dart';

import 'core/app/app_router.dart';
import 'core/app/di.dart';
import 'core/localization/logic/language_bloc.dart';
import 'core/localization/logic/language_event.dart';
import 'core/localization/logic/language_state.dart';
import 'features/auth/logic/login_cubit.dart';
import 'features/auth/logic/login_state.dart';
import 'features/auth/ui/views/login_view.dart';
import 'features/movies/ui/views/movies_view.dart';
import 'generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  await setupServiceLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              LoginCubit(authRepository: getIt())..checkLoginStatus(),
        ),
        BlocProvider(
          create: (context) => LanguageBloc(languageRepository: getIt())
            ..add(LoadPreferredLanguageEvent()),
        ),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          Locale locale = PlatformDispatcher.instance.locale;
          if (state is LanguageLoaded) {
            locale = state.locale;
          }
          return MaterialApp(
            key: ValueKey(locale.languageCode),
            locale: locale,
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: ThemeMode.dark,
            onGenerateRoute: AppRouter.generateRoute,
            home: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                if (state is LoginSuccessState) {
                  return const MoviesView();
                }
                return const LoginView();
              },
            ),
          );
        },
      ),
    );
  }
}
