class Planet {
  String name;
  String population;
  String terrain;
  List<dynamic> films;
  String url;
  String rotationPeriod;
  String orbitalPeriod;
  String diameter;
	String climate;
	String gravity;
	String surfaceWater;
	List<dynamic> residents;

  Planet({this.name, this.population, this.films, this.terrain});

  Planet.fromJson(Map<String, dynamic> jsonMap)
      : name = jsonMap['name'],
        terrain = jsonMap['terrain'],
        url = jsonMap['url'],
        films = jsonMap['films'],
        population = jsonMap['population'],
        rotationPeriod = jsonMap['rotation_period'],
        orbitalPeriod = jsonMap['orbital_period'],
        diameter = jsonMap['diameter'],
        climate = jsonMap['climate'],
        gravity = jsonMap['gravity'],
        surfaceWater = jsonMap['surface_water'],
        residents = jsonMap['residents'];
}
