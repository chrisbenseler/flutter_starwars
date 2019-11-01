import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/planet.dart';

const baseUrl = 'https://swapi.co/api/';

class API {
  static Future getPlanets() async {
    String url = baseUrl + 'planets';
  
    final response = await http.get(url);

    final List planetsRaw = json.decode(response.body)['results'];
    List<Planet> planets = planetsRaw.map( (raw) {
      return Planet.fromJson(raw);
    }).toList();
    return planets;
  }
}