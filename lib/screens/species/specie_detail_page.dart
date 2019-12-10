import 'package:flutter/material.dart';
import 'package:flutter_starwars/shared/inner_expandable_list.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../../models/specie.dart';

import '../../shared/screen_arguments.dart';
import '../../services/api.dart';

class SpecieDetailPage extends StatefulWidget {
  SpecieDetailPage({Key key}) : super(key: key);

  @override
  _SpecieDetailPageState createState() => _SpecieDetailPageState();
}

class _SpecieDetailPageState extends State<SpecieDetailPage> {
  Future<Specie> specie$;

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
      _getspecie(args.id);
    });
  }

  _getspecie(String id) {
    setState(() {
      specie$ = API.getSpecie(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Specie>(
      future: specie$,
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return Scaffold(
              appBar: new AppBar(
            title: new Text('Specie'),
          ));
        }
        if (hasLoaded == false) {
          Future.delayed(Duration(milliseconds: 10)).then((_) {
            pr.dismiss();
          });
          hasLoaded = true;
        }
        Specie specie = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            title: new Text('Specie ' + specie.name),
          ),
          body: Container(
            padding: EdgeInsets.all(20.0),
            constraints: BoxConstraints.expand(),
            child: new ListView(
              children: <Widget>[
                new Text('Home world: ' + specie.homeworld),
                new Text('Hair colors: ' + specie.hair_colors),
                new Text('Language: ' + specie.language),
                new Text('Skin color: ' + specie.skin_colors),
                new Text('Classification: ' + specie.classification),
                new Text('Designation: ' + specie.designation),
                new Text('Eye colors: ' + specie.eye_colors),
                new Text('Average lifespan: ' + specie.average_lifespan),
                SizedBox(
                  height: 10.0,
                ),
                new InnerExpandableList(itemsList: specie.films, title: 'Movies', onTap: (movie) {
                    String id = movie.split('https://swapi.co/api/films/')[1];
                    if (id.indexOf('/') > 0) {
                      id = id.split('/')[0];
                    }
                    final ScreenArguments arguments = new ScreenArguments(id);
                    Navigator.of(context)
                        .pushNamed('/movies/detail', arguments: arguments);
                  }),
                SizedBox(
                  height: 10.0,
                ),
                new InnerExpandableList(itemsList: specie.people, title: 'People', onTap: (movie) {
                    String id = movie.split('https://swapi.co/api/people/')[1];
                    if (id.indexOf('/') > 0) {
                      id = id.split('/')[0];
                    }
                    final ScreenArguments arguments = new ScreenArguments(id);
                    Navigator.of(context)
                        .pushNamed('/people/detail', arguments: arguments);
                  })
              ],
            ),
          ),
        );
      },
    );
  }
}
