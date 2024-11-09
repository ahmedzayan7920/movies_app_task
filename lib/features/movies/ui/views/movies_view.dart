import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../core/app/di.dart';
import '../../../../core/localization/logic/language_provider.dart';
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
      child: Scaffold(
        body: const SafeArea(
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
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            String locale = Intl.getCurrentLocale();
            if (locale == "en") {
              locale = "ar";
            } else {
              locale = "en";
            }
            Provider.of<LanguageProvider>(context, listen: false)
                .changeLanguage(locale);
          },
          child: const Icon(Icons.language_outlined),
        ),
      ),
    );
  }
}
