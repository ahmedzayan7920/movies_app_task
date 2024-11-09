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
      adult: json['adult'],
      backdropImage: "https://image.tmdb.org/t/p/w200${json['backdrop_path']}",
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      id: json['id'],
      originalLanguage: json['original_language'],
      originalTitle: json['original_title'],
      overview: json['overview'],
      popularity: (json['popularity'] as num).toDouble(),
      posterImage: "https://image.tmdb.org/t/p/w200${json['poster_path']}",
      releaseDate: json['release_date'],
      title: json['title'],
      video: json['video'],
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'],
      belongsToCollection: json['belongs_to_collection'] != null
          ? BelongsToCollection.fromJson(json['belongs_to_collection'])
          : null,
      budget: json['budget'],
      genres: json['genres'] != null
          ? (json['genres'] as List)
              .map((genre) => Genre.fromJson(genre))
              .toList()
          : null,
      homepage: json['homepage'],
      imdbId: json['imdb_id'],
      originCountry: json['origin_country'] != null
          ? List<String>.from(json['origin_country'])
          : null,
      productionCompanies: json['production_companies'] != null
          ? (json['production_companies'] as List)
              .map((company) => ProductionCompany.fromJson(company))
              .toList()
          : null,
      productionCountries: json['production_countries'] != null
          ? (json['production_countries'] as List)
              .map((country) => ProductionCountry.fromJson(country))
              .toList()
          : null,
      revenue: json['revenue'],
      runtime: json['runtime'],
      spokenLanguages: json['spoken_languages'] != null
          ? (json['spoken_languages'] as List)
              .map((language) => SpokenLanguage.fromJson(language))
              .toList()
          : null,
      status: json['status'],
      tagline: json['tagline'],
    );
  }
}

// Supporting models for complex types within MovieModel

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
      id: json['id'],
      name: json['name'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
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
      id: json['id'],
      name: json['name'],
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
      id: json['id'],
      name: json['name'],
      logoPath: json['logo_path'],
      originCountry: json['origin_country'],
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
      iso31661: json['iso_3166_1'],
      name: json['name'],
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
      iso6391: json['iso_639_1'],
      name: json['name'],
      englishName: json['english_name'],
    );
  }
}
