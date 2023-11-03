import 'package:moovidb/domain/models/movie_model.dart';
import 'package:moovidb/domain/repositories/movie_repository.dart';

class GetMovieUseCase {
  final MovieRepository repository;

  GetMovieUseCase(this.repository);

  Future<List<Movie>> fetchNowPlayingMovies() async {
    return await repository.getNowplayingMovies();
  }

  Future<List<Movie>> fetchPopularMovies() async {
    return await repository.getPopularMovies();
  }
}