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
  Future<Planet> planet$;

  ProgressDialog pr;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 10)).then((_) {
      final ScreenArguments args = ModalRoute.of(context).settings.arguments;
      pr = new ProgressDialog(context);
      pr.style(message: 'Please wait...');
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
        if(snapshot.hasData == false) {
          return Scaffold(
            appBar: new AppBar(
              title: new Text('Planet'),
            )
          );
        }
        Future.delayed(Duration(milliseconds: 10)).then((_) {
          pr.dismiss();
        });
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
                  new Text('Population: ' + planet.population.toString()),
                  new Text('Terrain: ' + planet.terrain.toString()),
                  new InnerMoviesList(moviesList: planet.films)
                ],
              ),
          ),
        );
      },
    );
  }
}
