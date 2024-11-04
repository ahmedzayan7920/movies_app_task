class MovieModel {
  final int id;
  final String title;
  final String overview;
  final String posterImage;
  final String backdropImage;
  final double voteAverage;
  final int voteCount;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterImage,
    required this.backdropImage,
    required this.voteAverage,
    required this.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      overview: json['overview'] ?? '',
      posterImage:
          "https://image.tmdb.org/t/p/w200${json['poster_path'] ?? ''}",
      backdropImage:
          "https://image.tmdb.org/t/p/w200${json['backdrop_path'] ?? ''}",
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      voteCount: json['vote_count'] ?? 0,
    );
  }
}
