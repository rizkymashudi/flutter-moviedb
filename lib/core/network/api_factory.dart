
enum ApiEndpoint {
  nowplayingMovies,
  popularMovies,
  topratedMovies,
  upcomingMovies
}

extension ApiEndpointExtension on ApiEndpoint {
  String get path {
    switch (this) {
      case ApiEndpoint.nowplayingMovies:
        return "/movie/now_playing";
      case ApiEndpoint.popularMovies:
        return "/movie/popular";
      case ApiEndpoint.topratedMovies:
        return "movie/top_rated";
      case ApiEndpoint.upcomingMovies:
        return "/movie/upcoming";
    }
  }
}