import 'package:moovidb/domain/models/movie_model.dart';

abstract class MovieRepository {
  Future<List<Movie>> getNowplayingMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
  Future<List<Movie>> getUpcomingMovies();
}