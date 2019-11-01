import 'package:flutter/material.dart';
import '../models/planet.dart';
import '../API.dart';

class Planets extends StatefulWidget {
  Planets({Key key}) : super(key: key);

  @override
  _PlanetsState createState() => _PlanetsState();
}

class _PlanetsState extends State<Planets> {
  List planets = <Planet>[];
  int page = 1;
  bool isLoading = false;
  ScrollController controller;
  bool hasNext = false;

  Widget _generateItem(Planet item) {
    return new Container(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        title: new Text(item.name, style: new TextStyle(fontSize: 24.0)),
        subtitle: new Container(
            child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Text('Population ' + item.population,
                style: new TextStyle(fontSize: 14.0)),
          ],
        )),
        trailing: Icon(Icons.keyboard_arrow_right),
        onLongPress: () {
          // do something else
          debugPrint('long press');
          Navigator.of(context).pushNamed('/planets/2');
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });
    _getNextPlanets();
    controller = new ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  _getNextPlanets() async {
    var response = await API.getPlanets(page);
    setState(() {
      isLoading = false;
      List<Planet> newPlanets = response['planets'];
      planets.addAll(newPlanets);
      hasNext = response['next'];
    });
  }

  void _scrollListener() {
    if (hasNext &&
        controller.position.pixels == controller.position.maxScrollExtent) {
      page++;
      setState(() {
        isLoading = true;
      });
      _getNextPlanets();
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(title: new Text('Planets')),
        body: Stack(
          children: <Widget>[
            ListView.builder(
                controller: controller,
                itemCount: planets.length,
                itemBuilder: (BuildContext ctxt, int index) {
                  return _generateItem(planets[index]);
                }),
            _loader()
          ],
        ));
  }

  Widget _loader() {
    return isLoading
        ? new Align(
            child: new Container(
              width: 70.0,
              height: 70.0,
              child: new Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: new Center(child: new CircularProgressIndicator())),
            ),
            alignment: FractionalOffset.bottomCenter,
          )
        : new SizedBox(
            width: 0.0,
            height: 0.0,
          );
  }
}
