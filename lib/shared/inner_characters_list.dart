import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starwars/shared/screen_arguments.dart';

class InnerCharactersList extends StatelessWidget {
  List<dynamic> charactersList;

  InnerCharactersList({ this.charactersList });

  @override
  Widget build(BuildContext context) {

    return new Card(child:
      Column(
        children: <Widget>[
          new Padding(
            padding: EdgeInsets.all(10.0),
            child: new Text('Characters', style: TextStyle(fontSize: 24.0),),
          ),
          new Column(
          children:
            charactersList.map( (character) {
              return new ListTile(
                title: new Text(character),
                trailing: Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  String id = character.split('https://swapi.co/api/people/')[1];
                  if(id.indexOf('/') > 0 ) {
                    id = id.split('/')[0];
                  }
                  final ScreenArguments arguments = new ScreenArguments(id);
                  Navigator.of(context).pushNamed('/characters/detail', arguments: arguments);
                },
              );
            }).toList()
          ,
        )
        ],
      )
    );
 
  }

}