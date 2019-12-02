import 'package:flutter/material.dart';

import 'screens/home/home_page.dart';
import 'screens/peoples/people_detail_page.dart';
import 'screens/planets/planet_detail_page.dart';
import 'screens/planets/planets_page.dart';
import 'screens/movies/movies_page.dart';
import 'screens/movies/movie_detail_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Star Wars API',
        color: Colors.blue,
        routes: {
          '/home': (context) => new Home(),
          '/planets/detail': (context) => new PlanetDetailPage(),
          '/planets': (context) => new Planets(),
          '/movies/detail': (context) => new MovieDetailPage(),
          '/movies': (context) => new MoviesPage(),

          '/people/detail': (context) => new PeopleDetailPage()
          
        },
        home: Home(),
        theme: ThemeData(
          primaryColor: Colors.black,
          primaryTextTheme: TextTheme(
            title: TextStyle(
              color: Colors.yellow
            )
          ),
          primaryIconTheme: const IconThemeData.fallback().copyWith(
            color: Colors.yellow,
          ),
        ),
        
      );
}
