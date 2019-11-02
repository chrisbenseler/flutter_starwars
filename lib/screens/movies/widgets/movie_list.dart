import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../models/movie.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList({this.movies});

  Widget _generateItem(Movie movie) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        title: Text(movie.title, style: TextStyle(fontSize: 24.0)),
        subtitle: Container(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(DateFormat('d/M/y').format(DateTime.parse(movie.releaseDate)),
                style: TextStyle(fontSize: 14.0)),
          ],
        )),
        trailing: Icon(Icons.keyboard_arrow_right),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext cxt, int index) {
          return _generateItem(movies[index]);
        });
  }
}
