import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moovidb/presentation/bloc/movie_bloc.dart';

class MovieListWidget extends StatelessWidget {
  const MovieListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      builder: (context, state) {
        if (state is MovieLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is MovieLoaded) {
          final movies = state.movies;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, index) {
              final movie = movies[index];
              return ListTile(
                title: Text(movie.title),
                subtitle: Text(movie.overview),
                leading: Image.network(
                  'https://image.tmdb.org/t/p/w185${movie.posterPath}',
                  width: 50,
                  height: 100,
                ),
              );
            },
          );
        } else if (state is MovieError) {
          return Center(
            child: Text('Error: ${state.message}'),
          );
        } else {
          return const Center(
            child: Text('Unknown state'),
          );
        }
      },
    );
  }
}