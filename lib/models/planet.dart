class Planet {
  String name;
  String population;
  String terrain;
  List<String> films;

  Planet({this.name, this.population, this.films, this.terrain});

  Planet.fromJson(Map<String, dynamic> jsonMap)
      : name = jsonMap['name'],
        terrain = jsonMap['terrain'],
        films = jsonMap['films'].split(','),
        population = jsonMap['population'];
}
