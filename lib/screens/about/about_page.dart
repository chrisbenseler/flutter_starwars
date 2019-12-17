import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
                Container(child: Text('This app has been written on the top of the famous Star Wars API using Flutter.'),),
                GestureDetector(
                  onTap: () {
                    launch("https://github.com/chrisbenseler/flutter_starwars");
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset('assets/github.png'),
                      Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      Text("Open project in Github: https://github.com/chrisbenseler/flutter_starwars")
                    ],
                  ) 
                  
                )
              ],
            )
          ),
        )
      ),
    );
  }
}