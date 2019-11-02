import 'package:flutter/material.dart';

import './../../models/movie.dart';
import '../../services/api.dart';
import '../../shared/loader.dart';
import 'widgets/movie_list.dart';

class MoviesPage extends StatefulWidget {
  @override
  _MoviesPageState createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  List<Movie> movies = [];
  bool isLoading = false;
  bool hasNext = false;

  @override
  void initState() {
    super.initState();

    setState(() {
      isLoading = true;
    });

    _getMovies();
  }

  void _getMovies() async {
    ResponseGetMovies response = await API.getMovies(1);

    setState(() {
      isLoading = false;
      hasNext = response.next;
      movies.addAll(response.movies);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text('Movies')),
      body: Stack(
        children: <Widget>[
          Loader(
            isLoading: isLoading,
          ),
          MovieList(movies: movies),
        ],
      ),
    );
  }
}
