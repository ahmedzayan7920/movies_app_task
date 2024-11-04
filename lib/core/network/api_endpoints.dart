abstract class ApiEndpoints {
  static const String popularMovies = '/movie/popular';
  static  String movieDetails({required int id}) => '/movie/$id';
}