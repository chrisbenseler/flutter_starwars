import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  RaisedButton _raisedButton(String label, String url, context) {
    return new RaisedButton(
      child: new Text(label, style: TextStyle(fontSize: 20.0)),
      onPressed: () => Navigator.of(context).pushNamed(url),
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
            Container(
              padding: EdgeInsets.all(20.0),
              child: _raisedButton('Planets', '/planets', context),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: _raisedButton('Movies', '/movies', context),
            )
          ],
        )
      )
    );
  }
}