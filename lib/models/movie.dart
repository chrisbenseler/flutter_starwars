import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()

class Movie {
  String title;
  int episode_id;
  String opening_crawl;
  String director;
  String producer;
  String release_date;
  List<dynamic> characters;

  Movie(
      {this.title,
      this.episode_id,
      this.opening_crawl,
      this.director,
      this.producer,
      this.release_date,
      this.characters});

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);

}
