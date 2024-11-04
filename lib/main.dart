import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'features/auth/logic/login_provider.dart';
import 'features/auth/ui/views/login_view.dart';
import 'features/movies/ui/views/movies_view.dart';
import 'package:provider/provider.dart';

import 'core/app/app_router.dart';
import 'core/app/di.dart';

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
