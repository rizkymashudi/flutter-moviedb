import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovidb/data/datasources/remote/movie_remote_datasource.dart';
import 'package:moovidb/data/repository/movie_repository.dart';
import 'package:moovidb/domain/usecase/movie_usecase.dart';
import 'package:moovidb/presentation/bloc/movie_bloc.dart';
import 'package:moovidb/presentation/widgets/movie_list_widget.dart';

class MovieListPage extends StatelessWidget {
  const MovieListPage({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieRemoteDataSource movieRemoteDataSource = DefaultMovieRemoteDataSource();
    final DefaultMovieRepository movieRepository = DefaultMovieRepository(movieRemoteDataSource: movieRemoteDataSource);
    final GetMovieUseCase getMovieUseCase = GetMovieUseCase(movieRepository);
    final MovieBloc movieBloc = MovieBloc(getMovieUseCase);

    return Scaffold(
      appBar: AppBar(
        title: const Text('MovieDB App'),
      ),
      body: BlocProvider(
        create: (context) => movieBloc..add(FetchMovies()),
        child: const MovieListWidget(),
      ),
    );
  }
}
