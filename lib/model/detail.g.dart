// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
      json['name'] as String,
      json['region'] as String,
      json['subregion'] as String,
      json['aplha2Code'] as String,
      json['population'] as int,
      json['demonym'] as String,
    );

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'name': instance.name,
      'region': instance.region,
      'subregion': instance.subregion,
      'aplha2Code': instance.aplha2Code,
      'population': instance.population,
      'demonym': instance.demonym,
    };
