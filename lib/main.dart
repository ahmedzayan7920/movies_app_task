import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:movies_app_task/core/themes/app_theme.dart';
import 'package:provider/provider.dart';

import 'core/app/app_router.dart';
import 'core/app/di.dart';
import 'core/localization/logic/language_provider.dart';
import 'core/localization/logic/language_state.dart';
import 'features/auth/logic/login_provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (BuildContext context) =>
              LoginProvider(authRepository: getIt()),
        ),
        ChangeNotifierProvider(
          create: (BuildContext context) =>
              LanguageProvider(languageRepository: getIt()),
        ),
      ],
      child: Consumer<LanguageProvider>(
        builder: (BuildContext context, LanguageProvider languageProvider,
            Widget? child) {
          final state = languageProvider.state;

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
            home: Consumer<LoginProvider>(
              builder:
                  (BuildContext context, LoginProvider value, Widget? child) {
                return value.isLoggedIn
                    ? const MoviesView()
                    : const LoginView();
              },
            ),
          );
        },
      ),
    );
  }
}
