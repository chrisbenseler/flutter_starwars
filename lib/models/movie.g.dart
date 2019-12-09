// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
      title: json['title'] as String,
      episodeId: json['episodeId'] as int,
      openingCrawl: json['openingCrawl'] as String,
      director: json['director'] as String,
      producer: json['producer'] as String,
      releaseDate: json['releaseDate'] as String);
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.title,
      'episodeId': instance.episodeId,
      'openingCrawl': instance.openingCrawl,
      'director': instance.director,
      'producer': instance.producer,
      'releaseDate': instance.releaseDate
    };
