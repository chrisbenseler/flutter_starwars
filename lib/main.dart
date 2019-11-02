import 'package:flutter/material.dart';

import 'screens/home/home_page.dart';
import 'screens/planets/planet_detail.dart';
import 'screens/planets/planets_page.dart';
import 'screens/movies/movies_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Star Wars API',
        color: Colors.blue,
        routes: {
          '/home': (context) => new Home(),
          '/planets/detail': (context) => new PlanetDetail(),
          '/planets': (context) => new Planets(),
          '/movies': (context) => new MoviesPage(),
        },
        home: Home(),
      );
}
