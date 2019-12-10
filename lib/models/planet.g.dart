// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'planet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Planet _$PlanetFromJson(Map<String, dynamic> json) {
  return Planet(
      name: json['name'] as String,
      population: json['population'] as String,
      films: json['films'] as List,
      terrain: json['terrain'] as String,
      url: json['url'] as String,
      rotation_period: json['rotation_period'] as String,
      diameter: json['diameter'] as String,
      climate: json['climate'] as String,
      gravity: json['gravity'] as String,
      surface_water: json['surface_water'] as String,
      residents: json['residents'] as List)
    ..orbital_period = json['orbital_period'] as String;
}

Map<String, dynamic> _$PlanetToJson(Planet instance) => <String, dynamic>{
      'name': instance.name,
      'population': instance.population,
      'terrain': instance.terrain,
      'films': instance.films,
      'url': instance.url,
      'rotation_period': instance.rotation_period,
      'orbital_period': instance.orbital_period,
      'diameter': instance.diameter,
      'climate': instance.climate,
      'gravity': instance.gravity,
      'surface_water': instance.surface_water,
      'residents': instance.residents
    };
