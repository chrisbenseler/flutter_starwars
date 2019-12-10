import 'package:json_annotation/json_annotation.dart';

part 'specie.g.dart';

@JsonSerializable()

class Specie {
  String name;
  String classification;
  String designation;
  String averageHeight;
  String skin_colors;
  String hair_colors;
  String eye_colors;
  String average_lifespan;
  String homeworld;
  String language;
  List<String> people;
  List<String> films;
  String created;
  String edited;
  String url;

  Specie(
      {this.name,
      this.classification,
      this.designation,
      this.averageHeight,
      this.skin_colors,
      this.hair_colors,
      this.eye_colors,
      this.average_lifespan,
      this.homeworld,
      this.language,
      this.people,
      this.films,
      this.created,
      this.edited,
      this.url});

  factory Specie.fromJson(Map<String, dynamic> json) => _$SpecieFromJson(json);
  Map<String, dynamic> toJson() => _$SpecieToJson(this);

}
