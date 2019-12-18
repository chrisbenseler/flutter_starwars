import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starwars/shared/screen_arguments.dart';

class MoviesHome extends StatelessWidget {
  const MoviesHome({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> items = [
      ['Attack of the Clones', 2],
      ['The Phantom Menace', 1],
      ['Revenge of the Sith', 3],
      ['A New Hope', 4],
      ['The Empire Strikes Back', 5],
      ['Return of the Jedi', 6],
      ['The Force Awakens', 7]
    ];
    return CupertinoPageScaffold(
      
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          title: new Text('Star Wars Universe: the Movies'),
        ),
        
        body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: items.length,
        itemBuilder: (BuildContext ctx, int index) {
          return Card(
            elevation: 8.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.black),
              child: new ListTile(
                leading: ConstrainedBox(
                  constraints: BoxConstraints(
                    minWidth: 44,
                    minHeight: 44,
                    maxWidth: 96,
                    maxHeight: 96,
                  ),
                  child: Image.asset('assets/movies/movie_'+ (index + 1).toString() + '.png'),
                ),
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    
                    new Text(
                      items[index][0],
                      style: TextStyle(
                          color: Colors.white),
                    ),
                  ],
                ),
                onTap: () {
                  final ScreenArguments arguments = new ScreenArguments(items[index][1].toString());
                    Navigator.of(context)
                        .pushNamed('/movies/detail', arguments: arguments);
                }
              ),
            ),
          );
        },
      ),
      ),
    );
  }
}
