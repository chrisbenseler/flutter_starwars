import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<dynamic> items  = [
      ['Planets', '/planets', Icons.location_on],
      ['Movies', '/movies', Icons.movie]
    ];
    return Container(
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('Star Wars API'),
        ),
        backgroundColor: Colors.black45,
        
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
                  title: new Text(items[index][0], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
                  leading: new Icon(items[index][2], color: Colors.white),
                  onTap: () {
                    Navigator.of(context).pushNamed(items[index][1]);
                  },
                  trailing: Icon(Icons.keyboard_arrow_right, color: Colors.white,),
                  
                ),
              ),
            );
          },
        ),
      )
    );
  }
}