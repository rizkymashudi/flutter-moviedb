import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovidb/domain/models/movie_model.dart';
import 'package:moovidb/domain/usecase/movie_usecase.dart';


class MovieEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchMovies extends MovieEvent {}

class MovieState extends Equatable {
  @override
  List<Object?> get props => [];
}

class MovieLoading extends MovieState {}

class MovieLoaded extends MovieState {
  final List<Movie> movies;

  MovieLoaded(this.movies);

  @override
  List<Object?> get props => [movies];
}

class MovieError extends MovieState {
  final String message;

  MovieError(this.message);

  @override
  List<Object?> get props => [message];
}

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetMovieUseCase movieUseCase;

  MovieBloc(this.movieUseCase) : super(MovieLoading());

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async* {
    if (event is FetchMovies) {
      yield MovieLoading();
      try {
        final movies = await movieUseCase.fetchNowPlayingMovies();
        yield MovieLoaded(movies);
      } catch (e) {
        yield MovieError(e.toString());
      }
    }
  }
}