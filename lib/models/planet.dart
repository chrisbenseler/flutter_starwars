class Planet {
  String name;
  String population;
  String terrain;
  List<dynamic> films;
  String url;

  Planet({this.name, this.population, this.films, this.terrain});

  Planet.fromJson(Map<String, dynamic> jsonMap)
      : name = jsonMap['name'],
        terrain = jsonMap['terrain'],
        url = jsonMap['url'],
        films = jsonMap['films'],
        population = jsonMap['population'];
}
