import 'package:moovidb/data/datasources/remote/movie_remote_datasource.dart';
import 'package:moovidb/domain/models/movie_model.dart';
import 'package:moovidb/domain/repositories/movie_repository.dart';

class DefaultMovieRepository implements MovieRepository {

  final MovieRemoteDataSource movieRemoteDataSource;

  DefaultMovieRepository({required this.movieRemoteDataSource});

  @override
  Future<List<Movie>> getNowplayingMovies() {
    return movieRemoteDataSource.getNowplayingMovies();
  }

  @override
  Future<List<Movie>> getPopularMovies() {
    return movieRemoteDataSource.getPopularMovies();
  }

  @override
  Future<List<Movie>> getTopRatedMovies() {
    return movieRemoteDataSource.getTopRatedMovies();
  }

  @override
  Future<List<Movie>> getUpcomingMovies() {
    return movieRemoteDataSource.getUpcomingMovies();
  }

}