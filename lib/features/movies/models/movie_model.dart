import '../../../core/utils/app_constants.dart';
import 'movie_keys.dart';

class MovieModel {
  final bool adult;
  final String backdropImage;
  final List<int> genreIds;
  final int id;
  final String originalLanguage;
  final String originalTitle;
  final String overview;
  final double popularity;
  final String posterImage;
  final String releaseDate;
  final String title;
  final bool video;
  final double voteAverage;
  final int voteCount;
  final BelongsToCollection? belongsToCollection;
  final int? budget;
  final List<Genre>? genres;
  final String? homepage;
  final String? imdbId;
  final List<String>? originCountry;
  final List<ProductionCompany>? productionCompanies;
  final List<ProductionCountry>? productionCountries;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguage>? spokenLanguages;
  final String? status;
  final String? tagline;

  MovieModel({
    required this.adult,
    required this.backdropImage,
    required this.genreIds,
    required this.id,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    required this.popularity,
    required this.posterImage,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.imdbId,
    this.originCountry,
    this.productionCompanies,
    this.productionCountries,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      adult: json[MovieKeys.adult] ?? false,
      backdropImage:
          "${AppConstants.baseImageUrl}${json[MovieKeys.backdropPath] ?? ''}",
      genreIds: List<int>.from(json[MovieKeys.genreIds] ?? []),
      id: json[MovieKeys.id] ?? 0,
      originalLanguage: json[MovieKeys.originalLanguage] ?? 'unknown',
      originalTitle: json[MovieKeys.originalTitle] ?? '',
      overview: json[MovieKeys.overview] ?? '',
      popularity: (json[MovieKeys.popularity] as num?)?.toDouble() ?? 0.0,
      posterImage:
          "${AppConstants.baseImageUrl}${json[MovieKeys.posterPath] ?? ''}",
      releaseDate: json[MovieKeys.releaseDate] ?? '',
      title: json[MovieKeys.title] ?? '',
      video: json[MovieKeys.video] ?? false,
      voteAverage: (json[MovieKeys.voteAverage] as num?)?.toDouble() ?? 0.0,
      voteCount: json[MovieKeys.voteCount] ?? 0,
      belongsToCollection: json[MovieKeys.belongsToCollection] != null
          ? BelongsToCollection.fromJson(json[MovieKeys.belongsToCollection])
          : null,
      budget: json[MovieKeys.budget],
      genres: json[MovieKeys.genres] != null
          ? (json[MovieKeys.genres] as List)
              .map((genre) => Genre.fromJson(genre))
              .toList()
          : null,
      homepage: json[MovieKeys.homepage],
      imdbId: json[MovieKeys.imdbId],
      originCountry: json[MovieKeys.originCountry] != null
          ? List<String>.from(json[MovieKeys.originCountry])
          : null,
      productionCompanies: json[MovieKeys.productionCompanies] != null
          ? (json[MovieKeys.productionCompanies] as List)
              .map((company) => ProductionCompany.fromJson(company))
              .toList()
          : null,
      productionCountries: json[MovieKeys.productionCountries] != null
          ? (json[MovieKeys.productionCountries] as List)
              .map((country) => ProductionCountry.fromJson(country))
              .toList()
          : null,
      revenue: json[MovieKeys.revenue],
      runtime: json[MovieKeys.runtime],
      spokenLanguages: json[MovieKeys.spokenLanguages] != null
          ? (json[MovieKeys.spokenLanguages] as List)
              .map((language) => SpokenLanguage.fromJson(language))
              .toList()
          : null,
      status: json[MovieKeys.status],
      tagline: json[MovieKeys.tagline],
    );
  }
}

class BelongsToCollection {
  final int id;
  final String name;
  final String? posterPath;
  final String? backdropPath;

  BelongsToCollection({
    required this.id,
    required this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) {
    return BelongsToCollection(
      id: json[MovieKeys.collectionId] ?? 0,
      name: json[MovieKeys.collectionName] ?? '',
      posterPath: json[MovieKeys.collectionPosterPath],
      backdropPath: json[MovieKeys.collectionBackdropPath],
    );
  }
}

class Genre {
  final int id;
  final String name;

  Genre({
    required this.id,
    required this.name,
  });

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(
      id: json[MovieKeys.genreId] ?? 0,
      name: json[MovieKeys.genreName] ?? '',
    );
  }
}

class ProductionCompany {
  final int id;
  final String name;
  final String? logoPath;
  final String originCountry;

  ProductionCompany({
    required this.id,
    required this.name,
    this.logoPath,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) {
    return ProductionCompany(
      id: json[MovieKeys.companyId] ?? 0,
      name: json[MovieKeys.companyName] ?? '',
      logoPath: json[MovieKeys.companyLogoPath],
      originCountry: json[MovieKeys.companyOriginCountry] ?? '',
    );
  }
}

class ProductionCountry {
  final String iso31661;
  final String name;

  ProductionCountry({
    required this.iso31661,
    required this.name,
  });

  factory ProductionCountry.fromJson(Map<String, dynamic> json) {
    return ProductionCountry(
      iso31661: json[MovieKeys.countryIsoCode] ?? '',
      name: json[MovieKeys.countryName] ?? '',
    );
  }
}

class SpokenLanguage {
  final String iso6391;
  final String name;
  final String englishName;

  SpokenLanguage({
    required this.iso6391,
    required this.name,
    required this.englishName,
  });

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) {
    return SpokenLanguage(
      iso6391: json[MovieKeys.languageIsoCode] ?? '',
      name: json[MovieKeys.languageName] ?? '',
      englishName: json[MovieKeys.languageEnglishName] ?? '',
    );
  }
}
