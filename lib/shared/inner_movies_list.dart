import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starwars/shared/screen_arguments.dart';

class InnerMoviesList extends StatelessWidget {
  List<dynamic> moviesList;

  InnerMoviesList({ this.moviesList });

  @override
  Widget build(BuildContext context) {

    return new Card(child:
      Column(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.all(10.0),
            child: new Text('Movies', style: TextStyle(fontSize: 24.0),),
          ),
          new Column(
          children:
            moviesList.map( (film) {
              return new ListTile(
                title: new Text(film),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  String id = film.split('https://swapi.co/api/films/')[1];
                  if(id.indexOf('/') > 0 ) {
                    id = id.split('/')[0];
                  }
                  final ScreenArguments arguments = new ScreenArguments(id);
                  Navigator.of(context).pushNamed('/movies/detail', arguments: arguments);
                },
              );
            }).toList()
          ,
        )
        ],
      )
    );
 
  }

}