import 'movie.dart';
import 'planet.dart';

class ResponseGetMovies {
  final List<Movie> movies;
  final bool next;

  const ResponseGetMovies({this.movies, this.next});
}

class ResponseGetPlanets {
  final List<Planet> planets;
  final bool next;

  const ResponseGetPlanets({this.planets, this.next});
}