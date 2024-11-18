import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app/di.dart';
import '../../logic/movies/movies_bloc.dart';
import '../../logic/movies/movies_event.dart';
import '../widgets/movies/language_drawer.dart';
import '../widgets/movies/movies_app_bar.dart';
import '../widgets/movies/movies_body.dart';

class MoviesView extends StatelessWidget {
  const MoviesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesBloc(movieRepository: getIt())..add(LoadPopularMoviesEvent()),
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
        drawer: LanguageDrawer(),
      ),
    );
  }
}
