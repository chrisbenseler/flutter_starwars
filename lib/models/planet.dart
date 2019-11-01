class Planet {
  String name;
  String population;
  
  Planet({this.name, this.population});

  Planet.fromJson(Map<String, dynamic> jsonMap) :
    name = jsonMap['name'],
    population = jsonMap['population'];
  
}