class Planet {
  String name;
  
  Planet({this.name});

  Planet.fromJson(Map<String, dynamic> jsonMap) :
    name = jsonMap['name'];
  
}