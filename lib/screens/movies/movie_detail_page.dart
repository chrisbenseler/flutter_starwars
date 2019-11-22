import 'package:flutter/material.dart';
import 'package:flutter_starwars/models/movie.dart';
import 'package:flutter_starwars/services/api.dart';
import 'package:flutter_starwars/shared/screen_arguments.dart';
import 'package:progress_dialog/progress_dialog.dart';

class MovieDetailPage extends StatefulWidget {
  MovieDetailPage({Key key}) : super(key: key);

  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  Future<Movie> movie$;
  ProgressDialog pr;

  Movie movie;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    Future.delayed(Duration(milliseconds: 10)).then((_) {
      final ScreenArguments args = ModalRoute.of(context).settings.arguments;
      pr = new ProgressDialog(context);
      pr.style(message: 'Please wait...');
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

          if(snapshot.hasData == false) {
            return Scaffold(
              appBar: new AppBar(
                title: new Text('Movie...'),
              )
            );
          }
          Future.delayed(Duration(milliseconds: 10)).then((_) {
            pr.dismiss();
          });
          
          Movie movie = snapshot.data;
          return Scaffold(
            appBar: new AppBar(
              title:
                  new Text('Movie: ' + movie.title),
            ),
            body: Container(
              padding: EdgeInsets.all(20.0),
              constraints: BoxConstraints.expand(),
              child: new Column(
                  children: <Widget>[
                    new Text('Director: ' + movie.director),
                    SizedBox( height: 10.0, ),
                   
                  ],
                ),
            ),
          );
        });
    
  }
}
