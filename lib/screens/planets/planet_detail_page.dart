import 'package:flutter/material.dart';

import '../../models/planet.dart';
import '../../shared/inner_movies_list.dart';
import '../../shared/screen_arguments.dart';
import '../../services/api.dart';

class PlanetDetailPage extends StatefulWidget {
  PlanetDetailPage({Key key}) : super(key: key);

  @override
  _PlanetDetailPageState createState() => _PlanetDetailPageState();
}

class _PlanetDetailPageState extends State<PlanetDetailPage> {
  Future<Planet> planet$;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(milliseconds: 10)).then((_) {
      final ScreenArguments args = ModalRoute.of(context).settings.arguments;
      _getPlanet(args.id);
    });
  }

  _getPlanet(String id) {
    
    setState(() {
      planet$ = API.getPlanet(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Planet'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        constraints: BoxConstraints.expand(),
        child: FutureBuilder<Planet>(
            future: planet$,
            builder: (context, snapshot) {
      
              Planet planet = snapshot.data;
              
              if (snapshot.hasData == false) {
                return new Container(
                  width: 70.0,
                  height: 70.0,
                  child: new Padding(
                      padding: const EdgeInsets.all(5.0),
                      child:
                          new Center(child: new CircularProgressIndicator())),
                );
              }
              
              return new Column(
                children: <Widget>[
                  new Text('Population: ' + planet.population.toString()),
                  new Text('Terrain: ' + planet.terrain.toString()),
                  new InnerMoviesList(moviesList: planet.films)
                ],
              );
            })
        
        ,
      ),
    );
  }
}
