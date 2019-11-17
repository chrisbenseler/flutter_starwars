import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starwars/shared/screen_arguments.dart';

class InnerMoviesList extends StatelessWidget {
  List<dynamic> moviesList;

  InnerMoviesList({ this.moviesList });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        new Text('Movies'),
        new Column(
          children:
            moviesList.map( (film) {
              return new ListTile(
                title: new Text(film),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  String id = film.split('https://swapi.co/api/films/')[1]; 
                  final ScreenArguments arguments = new ScreenArguments(id);
                  Navigator.of(context).pushNamed('/movies/detail', arguments: arguments);
                },
              );
            }).toList()
          ,
        )
      ],
    );
  }

}