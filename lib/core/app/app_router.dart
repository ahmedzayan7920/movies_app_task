import 'package:flutter/material.dart';
import '../../features/auth/ui/views/login_view.dart';
import '../../features/movies/ui/views/movie_details_view.dart';
import '../../features/movies/ui/views/movies_view.dart';

import 'app_routes.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case AppRoutes.movies:
        return MaterialPageRoute(builder: (_) => const MoviesView());
      case AppRoutes.movieDetails:
        final int id = settings.arguments as int;
        return MaterialPageRoute(builder: (_) => MovieDetailsView(movieId: id));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
