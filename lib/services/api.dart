import 'dart:async';
import 'dart:convert';
import 'package:flutter/rendering.dart';
import 'package:flutter_starwars/models/api.dart';
import 'package:flutter_starwars/models/people.dart';
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

  static Future<Planet> getPlanet(String id) async {
    String url = BASE_URL + 'planets/' + id;

    final response = await http.get(url);

    final planetRaw = json.decode(response.body);

    Planet planet = Planet.fromJson(planetRaw);
    return planet;
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

  static Future<Movie> getMovie(String id) async {
    String url = BASE_URL + 'films/' + id;
    final response = await http.get(url);

    final movieRaw = json.decode(response.body);

    Movie movie = Movie.fromJson(movieRaw);
    return movie;
  }

  static Future<People> getPeople(String id) async {
    String url = BASE_URL + 'people/' + id;
    final response = await http.get(url);

    final peopleRaw = json.decode(response.body);

    People people = People.fromJson(peopleRaw);
    return people;
  }

}

