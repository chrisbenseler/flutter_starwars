import 'package:json_annotation/json_annotation.dart';

part 'planet.g.dart';

@JsonSerializable()

class Planet {
  String name;
  String population;
  String terrain;
  List<dynamic> films;
  String url;
  String rotation_period;
  String orbital_period;
  String diameter;
	String climate;
	String gravity;
	String surface_water;
	List<dynamic> residents;

  Planet({
    this.name,
    this.population,
    this.films,
    this.terrain,
    this.url,
    this.rotation_period,
    this.diameter,
    this.climate,
    this.gravity,
    this.surface_water,
    this.residents
  });

  factory Planet.fromJson(Map<String, dynamic> json) => _$PlanetFromJson(json);
  Map<String, dynamic> toJson() => _$PlanetToJson(this);

}
