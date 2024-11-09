import 'package:flutter/material.dart';
import '../../../../core/app/di.dart';
import 'package:provider/provider.dart';

import '../../logic/movies/movies_provider.dart';
import '../widgets/movies/movies_app_bar.dart';
import '../widgets/movies/movies_body.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          MoviesProvider(movieRepository: getIt()),
      child: const Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                MoviesAppBar(),
                SizedBox(height: 10),
                Expanded(
                  child: MoviesBody(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
