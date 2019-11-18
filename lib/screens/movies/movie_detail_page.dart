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

  ProgressDialog pr;

  Movie movie;
  bool isLoading = true;

  Future openLoader$(pr) async {
    await Future.delayed(Duration(milliseconds: 100));
    pr.show();
  }

  Future closeLoader$(pr) async {
    await Future.delayed(Duration(milliseconds: 100));
    pr.hide();
  }

  void _getMovie(movieId, ProgressDialog pr) async {
    
    if(isLoading == false) {
      closeLoader$(pr);
      return;
    }

    openLoader$(pr);


    Movie _movie = await API.getMovie(movieId);

    setState(() {
      isLoading = false;
      movie = _movie;
    });

  }

  @override
  Widget build(BuildContext context) {

    if(pr == null) {
      pr = new ProgressDialog(context);
      pr.style(message: 'Please wait...');
    }
    
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;

    _getMovie(args.id.toString(), pr);
    
    return Scaffold(

      appBar: new AppBar(
        title: new Text(!isLoading ? ('Movie: ' + movie.title) : 'Movie...'),
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
                new Text('Director: ' + movie.director)
              ],
            ),
          )
        ,
      ),
    );
  }
}
