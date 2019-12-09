import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()

class Movie {
  String title;
  int episodeId;
  String openingCrawl;
  String director;
  String producer;
  String releaseDate;

  Movie(
      {this.title,
      this.episodeId,
      this.openingCrawl,
      this.director,
      this.producer,
      this.releaseDate});

    factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
    Map<String, dynamic> toJson() => _$MovieToJson(this);

/*
  Movie.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    episodeId = json['episode_id'];
    openingCrawl = json['opening_crawl'];
    director = json['director'];
    producer = json['producer'];
    releaseDate = json['release_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['episode_id'] = this.episodeId;
    data['opening_crawl'] = this.openingCrawl;
    data['director'] = this.director;
    data['producer'] = this.producer;
    data['release_date'] = this.releaseDate;
    return data;
  }
  */
}
