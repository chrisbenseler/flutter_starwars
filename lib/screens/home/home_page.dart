import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  Container _menuItem(String label, String url, Icon icon, context) {
    return new Container(
        padding: EdgeInsets.all(20.0),
        child: new RaisedButton(
          color: Colors.white70,
          shape: RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(200.0),
            side: BorderSide(color: Colors.yellow)
          ),
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              icon,
              new Text(label, style: TextStyle(fontSize: 24.0))
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
          padding: EdgeInsets.only(top: 32.0),
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