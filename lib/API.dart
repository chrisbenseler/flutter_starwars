import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/planet.dart';

const baseUrl = 'https://swapi.co/api/';

class API {
  static Future getPlanets(int page) async {
    String url = baseUrl + 'planets/?page=' + page.toString();
  
    final response = await http.get(url);

    final List planetsRaw = json.decode(response.body)['results'];
    List<Planet> planets = planetsRaw.map( (raw) {
      return Planet.fromJson(raw);
    }).toList();
    return {
      "planets": planets,
      "next": json.decode(response.body)['next'] != null
    };
  }
}