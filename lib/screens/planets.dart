import 'package:flutter/material.dart';
import '../models/planet.dart';
import '../API.dart';

class Planets extends StatefulWidget {
  Planets({Key key}) : super(key: key);

  @override
  _PlanetsState createState() => _PlanetsState();
}


class _PlanetsState extends State<Planets> {
  Future planets;

  @override
  void initState() {
    super.initState();
    planets = API.getPlanets();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('Planets')),
        body: Container(
          child: FutureBuilder(
            future: planets,
            builder: (context, snapshot) {

              if (snapshot.hasData) {
      
                List<Planet> planets = snapshot.data;
 
                return ListView.builder(
                    itemCount: planets.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return new Text(planets[index].name);
                    });
              } else if (snapshot.hasError) {
                return Text("Error: ${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();

            },
          ),
          /*
       child: ListView.builder(
         itemCount: planets.length,
         itemBuilder: (BuildContext ctxt, int index) {
          return new Text(planets[index].name);
          }
       ),
       */
        ));
  }
}
