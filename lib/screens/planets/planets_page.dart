import 'package:flutter/material.dart';
import 'package:flutter_starwars/shared/screen_arguments.dart';

import '../../models/planet.dart';
import '../../services/api.dart';
import '../../shared/loader.dart';

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

  Widget _generateItem(Planet item, int index) {
    return new Container(
      padding: const EdgeInsets.all(16.0),
      child: ListTile(
        title: new Text(item.name, style: new TextStyle(fontSize: 24.0)),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          String id = item.url.split('https://swapi.co/api/planets/')[1]; 
          final ScreenArguments arguments = new ScreenArguments(id);
          Navigator.of(context).pushNamed('/planets/detail', arguments: arguments);
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
                  return _generateItem(planets[index], index);
                }),
            Loader(
              isLoading: isLoading,
            )
          ],
        ));
  }
}
