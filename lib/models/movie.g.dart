// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
      title: json['title'] as String,
      episode_id: json['episode_id'] as int,
      opening_crawl: json['opening_crawl'] as String,
      director: json['director'] as String,
      producer: json['producer'] as String,
      release_date: json['release_date'] as String,
      characters: json['characters'] as List,
      planets: json['planets'] as List,
      starships: json['starships'] as List,
      vehicles: json['vehicles'] as List,
      species: json['species'] as List);
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.title,
      'episode_id': instance.episode_id,
      'opening_crawl': instance.opening_crawl,
      'director': instance.director,
      'producer': instance.producer,
      'release_date': instance.release_date,
      'characters': instance.characters,
      'planets': instance.planets,
      'starships': instance.starships,
      'vehicles': instance.vehicles,
      'species': instance.species
    };
