import 'package:flutter/material.dart';
import './app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Star Wars API',
        color: Colors.blue,
        home: App(),
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
