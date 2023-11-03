import 'package:dio/dio.dart';
import 'package:moovidb/core/network/api_factory.dart';
import 'package:moovidb/core/network/network_service.dart';
import 'package:moovidb/data/entities/movie_entities.dart';
import 'package:moovidb/domain/models/movie_model.dart';

abstract class MovieRemoteDataSource {
  Future<List<Movie>> getNowplayingMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
  Future<List<Movie>> getUpcomingMovies();
}

class DefaultMovieRemoteDataSource implements MovieRemoteDataSource {
  final Dio dio;
  final NetworkService networkService;

  DefaultMovieRemoteDataSource()
      : dio = Dio(),
        networkService = NetworkService(Dio());

  @override
  Future<List<Movie>> getNowplayingMovies() async {
    try {
      final nowPlayingMovies = await networkService.get(ApiEndpoint.nowplayingMovies, (json) {
        final List<MovieResponse> movieResponses = (json as List)
            .map((item) => MovieResponse.fromJson(item))
            .toList();

        return movieResponses.map((response) => Movie(
          id: response.id,
          title: response.title,
          overview: response.overview,
          posterPath: response.posterPath,
        )).toList();
      });

      return nowPlayingMovies;
    } catch (e) {
      // Handle errors
      throw e;
    }
  }

  @override
  Future<List<Movie>> getTopRatedMovies() {
    // TODO: implement getTopRatedMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getUpcomingMovies() {
    // TODO: implement getUpcomingMovies
    throw UnimplementedError();
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    try {
      final popularMovies = await networkService.get(ApiEndpoint.popularMovies, (json) {
        final List<MovieResponse> movieResponses = (json as List)
            .map((item) => MovieResponse.fromJson(item))
            .toList();
            
        return movieResponses.map((response) => Movie(
          id: response.id,
          title: response.title,
          overview: response.overview,
          posterPath: response.posterPath,
        )).toList();
      });

      return popularMovies;
    } catch (e) {
      // Handle errors
      throw e;
    }
  }
}
