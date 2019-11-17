import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';

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

  ProgressDialog pr;

  Planet planet;
  bool isLoading = true;

  Future openLoader$(pr) async {
    await Future.delayed(Duration(milliseconds: 100));
    pr.show();
  }

  Future closeLoader$(pr) async {
    await Future.delayed(Duration(milliseconds: 100));
    pr.hide();
  }

  void _getPlanet(planetId, ProgressDialog pr) async {
    if(isLoading == false) {
      closeLoader$(pr);
      return;
    }

    openLoader$(pr);


    Planet _planet = await API.getPlanet(planetId);

    setState(() {
      isLoading = false;
      planet = _planet;
    });
  }


  @override
  Widget build(BuildContext context) {

    if(pr == null) {
      pr = new ProgressDialog(context);
      pr.style(message: 'Please wait...');
    }
    
    
    
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    _getPlanet(args.id.toString(), pr);
    
    return Scaffold(

      appBar: new AppBar(
        title: new Text(!isLoading ? ('Planet: ' + planet.name) : 'Planet...'),
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        constraints: BoxConstraints.expand(),
        child: isLoading ?
          new Text('')
          :
          Card(
            borderOnForeground: true,
            child: Column(
              children: <Widget>[
                new Text('Population: ' + planet.population.toString()),
                new Text('Terrain: ' + planet.terrain.toString()),
                new InnerMoviesList(moviesList: planet.films)
              ],
            ),
          )
        ,
      ),
    );
  }
}