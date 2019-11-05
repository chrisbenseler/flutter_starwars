import 'package:flutter/cupertino.dart';

class MoviesList extends StatelessWidget {
  List<dynamic> moviesList;


  MoviesList({ this.moviesList });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        new Text('Movies'),
        new Column(
          children:
            moviesList.map( (film) {
              return new Text(film);
            }).toList()
          ,
        )
      ],
    );
  }

}