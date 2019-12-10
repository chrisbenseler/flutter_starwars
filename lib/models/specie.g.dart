// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'specie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Specie _$SpecieFromJson(Map<String, dynamic> json) {
  return Specie(
      name: json['name'] as String,
      classification: json['classification'] as String,
      designation: json['designation'] as String,
      averageHeight: json['averageHeight'] as String,
      skin_colors: json['skin_colors'] as String,
      hair_colors: json['hair_colors'] as String,
      eye_colors: json['eye_colors'] as String,
      average_lifespan: json['average_lifespan'] as String,
      homeworld: json['homeworld'] as String,
      language: json['language'] as String,
      people: (json['people'] as List)?.map((e) => e as String)?.toList(),
      films: (json['films'] as List)?.map((e) => e as String)?.toList(),
      created: json['created'] as String,
      edited: json['edited'] as String,
      url: json['url'] as String);
}

Map<String, dynamic> _$SpecieToJson(Specie instance) => <String, dynamic>{
      'name': instance.name,
      'classification': instance.classification,
      'designation': instance.designation,
      'averageHeight': instance.averageHeight,
      'skin_colors': instance.skin_colors,
      'hair_colors': instance.hair_colors,
      'eye_colors': instance.eye_colors,
      'average_lifespan': instance.average_lifespan,
      'homeworld': instance.homeworld,
      'language': instance.language,
      'people': instance.people,
      'films': instance.films,
      'created': instance.created,
      'edited': instance.edited,
      'url': instance.url
    };
