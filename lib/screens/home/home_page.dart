import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  Container _menuItem(String label, String url, Icon icon, context) {
    return new Container(
        padding: EdgeInsets.all(20.0),
        child: new RaisedButton(
        child: new Column(
          children: <Widget>[
            new Padding(padding: EdgeInsets.all(10.0),),
            icon,
            new Text(label, style: TextStyle(fontSize: 20.0))
          ],
        ),
        onPressed: () => Navigator.of(context).pushNamed(url),
      )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Star Wars API'),
        ),
        body: GridView.count(
          crossAxisCount: 2,
          children: <Widget>[
            _menuItem('Planets', '/planets', new Icon(Icons.location_on, size: 48.0,), context),
            _menuItem('Movies', '/movies', new Icon(Icons.movie, size: 48.0,), context),
          ],
        )
      )
    );
  }
}