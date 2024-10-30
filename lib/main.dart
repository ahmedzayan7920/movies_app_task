import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'core/networks/api_response.dart';
import 'core/networks/dio_client.dart';

Future<Resource<List<Movie>>> fetchMovies() async {
  final apiService = DioClient();
  final response = await apiService.getRequest('/movie/popular');
  if (response.data != null) {
    List<Movie> movies =
        (response.data!['results'] as List).map((e) => Movie.fromJson(e)).toList();
    return Resource.success(movies);
  } else {
    return Resource.error(response.error ?? "unknownError");
  }
}

class Movie {
  final int id;
  final String title;
  final String posterPath;

  Movie({required this.id, required this.title, required this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
    );
  }
}

void main() async {
  await dotenv.load();
  final movies = await fetchMovies();
  print(movies.status);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
