import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starwars/models/planet.dart';
import 'package:flutter_starwars/screens/planets/planets_page.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> items = [
      ['Planets', '/planets', Icons.location_on],
      ['Movies', '/movies', Icons.movie]
    ];
    return CupertinoPageScaffold(
      
      child: Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          title: new Text('Home'),
        ),
        
        body: ListView.builder(
        padding: EdgeInsets.all(10.0),
        itemCount: items.length,
        itemBuilder: (BuildContext ctx, int index) {
          return Card(
            elevation: 8.0,
            margin: new EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
            child: Container(
              decoration: BoxDecoration(color: Colors.grey),
              child: new ListTile(
                title: new Text(
                  items[index][0],
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                leading: new Icon(items[index][2], color: Colors.white),
                onTap: () {
                  Navigator.of(context).pushNamed(items[index][1]);

                  /*
                  Navigator.of(context).push(CupertinoPageRoute<void>(
                    // title: colorName,
                    builder: (BuildContext context) => Planets(),
                  ));
                  */
                },
                trailing: Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.white,
                ),
              ),
            ),
          );
        },
      ),
      ),
    );
  }
}
