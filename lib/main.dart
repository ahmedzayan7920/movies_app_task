import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'core/app/app_router.dart';
import 'core/app/di.dart';
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
    return ChangeNotifierProvider.value(
      value: getIt<LoginProvider>(),
      child: MaterialApp(
        localizationsDelegates: const [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true),
        onGenerateRoute: AppRouter.generateRoute,
        home: Consumer<LoginProvider>(
          builder: (BuildContext context, LoginProvider value, Widget? child) {
            return value.isLoggedIn ? const MoviesView() : const LoginView();
          },
        ),
      ),
    );
  }
}
