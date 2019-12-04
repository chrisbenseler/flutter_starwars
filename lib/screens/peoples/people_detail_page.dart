import 'package:flutter/material.dart';
import 'package:flutter_starwars/shared/inner_expandable_list.dart';
import 'package:progress_dialog/progress_dialog.dart';

import '../../models/people.dart';

import '../../shared/screen_arguments.dart';
import '../../services/api.dart';

class PeopleDetailPage extends StatefulWidget {
  PeopleDetailPage({Key key}) : super(key: key);

  @override
  _PeopleDetailPageState createState() => _PeopleDetailPageState();
}

class _PeopleDetailPageState extends State<PeopleDetailPage> {
  Future<People> People$;

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
      _getPeople(args.id);
    });
  }

  _getPeople(String id) {
    setState(() {
      People$ = API.getPeople(id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<People>(
      future: People$,
      builder: (context, snapshot) {
        if (snapshot.hasData == false) {
          return Scaffold(
              appBar: new AppBar(
            title: new Text('Character'),
          ));
        }
        if (hasLoaded == false) {
          Future.delayed(Duration(milliseconds: 10)).then((_) {
            pr.dismiss();
          });
          hasLoaded = true;
        }
        People people = snapshot.data;
        return Scaffold(
          appBar: AppBar(
            title: new Text('Character ' + people.name),
          ),
          body: Container(
            padding: EdgeInsets.all(20.0),
            constraints: BoxConstraints.expand(),
            child: new Column(
              children: <Widget>[
       
                new Text('Height: ' + people.height),
                new Text('Mass: ' + people.mass),
                new Text('Hair color: ' + people.hairColor),
                new Text('Skin color: ' + people.skinColor),
                new Text('Eye color: ' + people.eyeColor),
                new Text('Birth year: ' + people.birthYear),
                new Text('Gender: ' + people.gender),
                new Text('Home world: ' + people.homeworld),
                SizedBox(
                  height: 10.0,
                ),
                new InnerExpandableList(itemsList: people.films, title: 'Movies', onTap: (movie) {
                  String id = movie.split('https://swapi.co/api/films/')[1];
                  if (id.indexOf('/') > 0) {
                    id = id.split('/')[0];
                  }
                  final ScreenArguments arguments = new ScreenArguments(id);
                  Navigator.of(context)
                      .pushNamed('/movies/detail', arguments: arguments);
                }),
                new InnerExpandableList(itemsList: people.species, title: 'Species', onTap: (specie) {
                  
                })
              ],
            ),
          ),
        );
      },
    );
  }
}
