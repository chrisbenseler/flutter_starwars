import 'package:flutter/material.dart';
import 'package:flutter_starwars/models/movie.dart';
import 'package:flutter_starwars/services/api.dart';

import 'package:flutter_starwars/shared/inner_expandable_list.dart';
import 'package:flutter_starwars/shared/screen_arguments.dart';
import 'package:intl/intl.dart';
import 'package:progress_dialog/progress_dialog.dart';

class MovieDetailPage extends StatefulWidget {
  MovieDetailPage({Key key}) : super(key: key);

  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  Future<Movie> movie$;
  ProgressDialog pr;

  Movie movie;
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
      _getMovie(args.id);
    });
  }

  void _getMovie(movieId) async {
    setState(() {
      movie$ = API.getMovie(movieId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Movie>(
        future: movie$,
        builder: (context, snapshot) {
          if (snapshot.hasData == false) {
            return Scaffold(
                appBar: new AppBar(
              title: new Text('Movie...'),
            ));
          }
          if (hasLoaded == false) {
            Future.delayed(Duration(milliseconds: 10)).then((_) {
              pr.dismiss();
            });
            hasLoaded = true;
          }

          Movie movie = snapshot.data;
          return Scaffold(
            appBar: new AppBar(
              title: new Text('Movie: ' + movie.title),
            ),
            body: Container(
              padding: EdgeInsets.all(20.0),
              constraints: BoxConstraints.expand(),
              child: new ListView(
                children: <Widget>[
                  new Text('Director: ' + movie.director),
                  new Text('Producer: ' + movie.producer),
                  new Text('Release date: ' +
                      DateFormat('d/M/y')
                          .format(DateTime.parse(movie.releaseDate))),
                  SizedBox(
                    height: 10.0,
                  ),
                  new Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      new Card(
                        child: new Padding(
                          padding: EdgeInsets.all(15.0),
                          child: new Text(
                              movie.openingCrawl.replaceAll("\n", " ")),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  new InnerExpandableList(itemsList: movie.characters, title: 'Characters', onTap: (character) {
                    String id = character.split('https://swapi.co/api/people/')[1];
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
        });
  }
}
