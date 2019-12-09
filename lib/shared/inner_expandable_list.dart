import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InnerExpandableList extends StatelessWidget {
  List<dynamic> itemsList;
  Function onTap;
  String title;

  InnerExpandableList({this.itemsList, this.onTap, this.title});

  @override
  Widget build(BuildContext context) {
    return new Card(
      child: new ExpansionTile(
      title: new Text(this.title),
      children: itemsList.map((item) {
        return new ListTile(
          title: new Text(item),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            this.onTap(item);
          },
        );
      }).toList(),
    ));
  }
}