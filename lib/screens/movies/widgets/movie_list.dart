import 'package:flutter/material.dart';
import 'package:flutter_starwars/shared/screen_arguments.dart';
import 'package:intl/intl.dart';

import '../../../models/movie.dart';

class MovieList extends StatelessWidget {
  final List<Movie> movies;

  MovieList({this.movies});

  Widget _generateItem(Movie movie, ctx) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        title: Text(movie.title, style: TextStyle(fontSize: 24.0)),
        subtitle: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(DateFormat('d/M/y').format(DateTime.parse(movie.release_date)),
                  style: TextStyle(fontSize: 14.0)),
            ],
        )),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          String id = movie.episode_id.toString();
          final ScreenArguments arguments = new ScreenArguments(id);
          Navigator.of(ctx).pushNamed('/movies/detail', arguments: arguments);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: movies.length,
        itemBuilder: (BuildContext cxt, int index) {
          return _generateItem(movies[index], context);
        });
  }
}
