import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starwars/screens/about/about_page.dart';
import 'package:flutter_starwars/screens/home/home_page.dart';
import 'package:flutter_starwars/screens/movies/movies_home.dart';

import 'screens/movies/movie_detail_page.dart';
import 'screens/movies/movies_page.dart';
import 'screens/peoples/people_detail_page.dart';
import 'screens/planets/planet_detail_page.dart';
import 'screens/planets/planets_page.dart';
import 'screens/species/specie_detail_page.dart';


enum TabItem { home, about }

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => AppState();
}

class AppState extends State<App> {
  
  static const String routeName = '/';
  var routes = {
    '/planets/detail': (context) => new PlanetDetailPage(),
    '/planets': (context) => new Planets(),
    '/movies/detail': (context) => new MovieDetailPage(),
    '/movies': (context) => new MoviesPage(),

    '/people/detail': (context) => new PeopleDetailPage(),
    '/specie/detail': (context) => new SpecieDetailPage()
  };

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      // Prevent swipe popping of this page. Use explicit exit buttons only.
      onWillPop: () => Future<bool>.value(true),
      child: DefaultTextStyle(
        style: CupertinoTheme.of(context).textTheme.textStyle,
        child: CupertinoTabScaffold(
          
          tabBar: CupertinoTabBar(
            backgroundColor: Colors.black,
            activeColor: Colors.white,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.movie),
                title: Text('Movies'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.search),
                title: Text('Browse'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.forum),
                title: Text('About'),
              )
            ],
          ),
          tabBuilder: (BuildContext context, int index) {
            assert(index >= 0 && index <= 2);
            switch (index) {
              case 0:
                return CupertinoTabView(
                  routes: routes,
                  builder: (BuildContext context) {
                    return MoviesHome();
                  },
                  defaultTitle: 'Movies',
                );
                break;
              case 1:
                return CupertinoTabView(
                  routes: routes,
                  builder: (BuildContext context) {
                    return Home();
                  },
                  defaultTitle: 'Home',
                );
                break;
              case 2:
                return CupertinoTabView(
                  builder: (BuildContext context) {
                    return AboutPage();
                  },
                  defaultTitle: 'About',
                );
                break;
              
            }
            return null;
          },
        ),
      ),
    );
  }


}
