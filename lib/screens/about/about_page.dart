import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: new Text('About')),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Card(
          
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Column(
              children: <Widget>[
                Image.asset('assets/starwars.jpg'),
                Container(child: Text('This app has been written on the top of the famous Star Wars API using Flutter.'),)
              ],
            )
          ),
        )
      ),
    );
  }
}