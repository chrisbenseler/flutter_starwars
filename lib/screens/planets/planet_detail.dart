import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_starwars/models/planet.dart';
import 'package:flutter_starwars/shared/screen_arguments.dart';
import 'package:loading_indicator/loading_indicator.dart';
import '../../services/api.dart';

class PlanetDetail extends StatefulWidget {
  
  PlanetDetail({Key key}) : super(key: key);
  

  @override
  _PlanetDetailState createState() => _PlanetDetailState();
}

class _PlanetDetailState extends State<PlanetDetail> {

  Planet planet;
  bool isLoading = true;

  void _getPlanet(planetId) async {
    if(isLoading == false) {
      return;
    }
    debugPrint('init state');

    Planet _planet = await API.getPlanet(planetId);
    setState(() {
      isLoading = false;
      planet = _planet;
    });
  }


  @override
  Widget build(BuildContext context) {
    
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    _getPlanet(args.id);
    
    return Scaffold(
      appBar: new AppBar(
        title: new Text(!isLoading ? ('Planet: ' + planet.name) : 'Planet...'),
      ),
      body: Container(
        child: isLoading ?
          LoadingIndicator(
            indicatorType: Indicator.orbit,
            
          )
          :
          Card(

          )
        ,
      ),
    );
  }
}