import 'package:flutter/material.dart';
import 'package:flutter_starwars/shared/inner_expandable_list.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../../models/planet.dart';

import '../../shared/screen_arguments.dart';
import '../../services/api.dart';

class PlanetDetailPage extends StatefulWidget {
  PlanetDetailPage({Key key}) : super(key: key);

  @override
  _PlanetDetailPageState createState() => _PlanetDetailPageState();
}

class _PlanetDetailPageState extends State<PlanetDetailPage> {
  Future<Planet> planet$;

  ProgressDialog pr;
  bool hasLoaded = false;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 10)).then((_) {
      final ScreenArguments args = ModalRoute.of(context).settings.arguments;
      pr = new ProgressDialog(context);
      pr.style(
          message: 'Please wait...',
          progressWidget: CircularProgressIndicator(
              valueColor: new AlwaysStoppedAnimation<Color>(Colors.yellow)));
      pr.show();
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
    return FutureBuilder<Planet>(
      future: planet$,
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return Scaffold(
              appBar: new AppBar(
            title: new Text('Planet'),
          ));
        }
        if (hasLoaded == false) {
          Future.delayed(Duration(milliseconds: 10)).then((_) {
            pr.dismiss();
          });
          hasLoaded = true;
        }
        Planet planet = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            title: new Text('Planet ' + planet.name),
          ),
          body: Container(
            padding: EdgeInsets.all(20.0),
            constraints: BoxConstraints.expand(),
            child: new Column(
              children: <Widget>[
                new Text('Population: ' + planet.population),
                new Text('Terrain: ' + planet.terrain),
                new Text('Rotation period: ' + planet.rotationPeriod),
                new Text('Orbital period: ' + planet.orbitalPeriod),
                new Text('Diameter: ' + planet.diameter),
                new Text('Climate: ' + planet.climate),
                new Text('Gravity: ' + planet.gravity),
                new Text('Surface water: ' + planet.surfaceWater),
                SizedBox(
                  height: 10.0,
                ),
                new InnerExpandableList(itemsList: planet.films, title: 'Movies', onTap: (movie) {
                    String id = movie.split('https://swapi.co/api/films/')[1];
                    if (id.indexOf('/') > 0) {
                      id = id.split('/')[0];
                    }
                    final ScreenArguments arguments = new ScreenArguments(id);
                    Navigator.of(context)
                        .pushNamed('/movies/detail', arguments: arguments);
                  })
              ],
            ),
          ),
        );
      },
    );
  }
}
