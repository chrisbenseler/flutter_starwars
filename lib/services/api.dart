import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import './../models/planet.dart';
import './../models/movie.dart';

const BASE_URL = 'https://swapi.co/api/';

class API {
  static Future getPlanets(int page) async {
    String url = BASE_URL + 'planets/?page=' + page.toString();

    final response = await http.get(url);

    final List planetsRaw = json.decode(response.body)['results'];

    List<Planet> planets = planetsRaw.map((raw) {
      return Planet.fromJson(raw);
    }).toList();
    return {
      "planets": planets,
      "next": json.decode(response.body)['next'] != null
    };
  }

  static Future<ResponseGetMovies> getMovies(int page) async {
    final String url = BASE_URL + 'films/?page=' + page.toString();
    final response = await http.get(url);

    final List moviesRaw = json.decode(response.body)['results'];

    List<Movie> movies =
        moviesRaw.map((movie) => Movie.fromJson(movie)).toList();

    return ResponseGetMovies(
      movies: movies,
      next: json.decode(response.body)['next'] != null,
    );
  }
}

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
