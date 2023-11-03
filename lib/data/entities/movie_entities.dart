class MovieResponse {
  final int id;
  final String title;
  final String overview;
  final String posterPath;

  const MovieResponse({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
  });

  factory MovieResponse.fromJson(Map<String, dynamic> json) {
    return MovieResponse(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
    );
  }
}