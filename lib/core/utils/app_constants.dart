import '../../features/movies/models/movie_model.dart';
import 'app_keys.dart';
import 'app_strings.dart';

abstract class AppConstants {
  static const String mockEmail = "ahmed@gmail.com";
  static const String mockPassword = "Ahmed@123";
  static const String baseImageUrl = "https://image.tmdb.org/t/p/w200";
  static final List<Map<String, String>> supportedLanguages = [
    {AppKeys.languageCode: 'en', AppKeys.languageLabel: AppStrings.englishLanguage},
    {AppKeys.languageCode: 'ar', AppKeys.languageLabel: AppStrings.arabicLanguage},
  ];
  static MovieModel fakeMovieModel = MovieModel(
    id: 0,
    title: 'Venom: The Last Dance',
    overview: 'Overview of the movie Venom: The Last Dance ...',
    posterImage: '',
    releaseDate: '2021-09-01',
    voteAverage: 7.5,
    voteCount: 1000,
    genres: [
      Genre(id: 0, name: 'Action'),
      Genre(id: 1, name: 'Adventure'),
    ],
    productionCompanies: [
      ProductionCompany(
        id: 0,
        name: 'Marvel Studios',
        logoPath: '',
        originCountry: 'US',
      ),
      ProductionCompany(
        id: 1,
        name: 'Sony Pictures',
        logoPath: '',
        originCountry: 'US',
      ),
    ],
    productionCountries: [
      ProductionCountry(
        iso31661: 'US',
        name: 'United States of America',
      ),
      ProductionCountry(
        iso31661: 'CA',
        name: 'Canada',
      ),
    ],
    spokenLanguages: [
      SpokenLanguage(
        iso6391: 'en',
        name: 'English',
        englishName: 'English',
      ),
      SpokenLanguage(
        iso6391: 'fr',
        name: 'Français',
        englishName: 'French',
      ),
    ],
    adult: false,
    backdropImage: '',
    genreIds: [0, 1],
    originalLanguage: 'en',
    originalTitle: 'Venom: The Last Dance',
    popularity: 100.0,
    video: false,
  );
}
