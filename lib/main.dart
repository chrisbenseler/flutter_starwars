import 'package:flutter/material.dart';

import 'screens/home.dart';
import 'screens/planet_detail.dart';
import 'screens/planets.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>  MaterialApp(
        title: 'Star Wars API',
        color: Colors.blue,
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => new Home(),
          '/planets/2': (BuildContext context) => new PlanetDetail(),
          '/planets': (BuildContext context) => new Planets(),
        },
        home: Home(),
      );


}